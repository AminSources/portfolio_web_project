import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';

import '../../helpers/fakes.dart';

void main() {
  group('WorksBloc', () {
    late FakePortfolioRepository repository;
    late WorksBloc bloc;

    setUp(() {
      repository = FakePortfolioRepository(DataSuccess([kSampleWork]));
      bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
      );
    });

    tearDown(() {
      bloc.close();
    });

    test('initial state is WorksInitial', () {
      expect(bloc.state, isA<WorksInitial>());
    });

    blocTest<WorksBloc, WorksState>(
      'emits [WorksLoading, WorksSuccess] with works on LoadWorkEvent',
      build: () {
        repository = FakePortfolioRepository(
          DataSuccess<List<WorkEntity>>([kSampleWork, kSampleWork2]),
        );
        return WorksBloc(
          getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
        );
      },
      act: (b) => b.add(LoadWorkEvent()),
      expect: () => [
        isA<WorksLoading>(),
        WorksSuccess([kSampleWork, kSampleWork2]),
      ],
      verify: (_) {
        expect(repository.callCount, 1);
      },
    );

    blocTest<WorksBloc, WorksState>(
      'emits [WorksLoading, WorksFailure] when usecase fails',
      build: () {
        repository = FakePortfolioRepository(
          DataFailure<List<WorkEntity>>('Could not get works data'),
        );
        return WorksBloc(
          getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
        );
      },
      act: (b) => b.add(LoadWorkEvent()),
      expect: () => [
        isA<WorksLoading>(),
        const WorksFailure('Could not get works data'),
      ],
    );

    blocTest<WorksBloc, WorksState>(
      'emits WorksSuccess with empty list when no works exist',
      build: () {
        repository = FakePortfolioRepository(
          DataSuccess<List<WorkEntity>>([]),
        );
        return WorksBloc(
          getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
        );
      },
      act: (b) => b.add(LoadWorkEvent()),
      expect: () => [isA<WorksLoading>(), const WorksSuccess([])],
    );

    test('LoadWorkEvent equality works (Equatable)', () {
      expect(LoadWorkEvent(), equals(LoadWorkEvent()));
    });

    test('WorksSuccess compares by its works list', () {
      expect(
        WorksSuccess([kSampleWork]),
        equals(WorksSuccess([kSampleWork])),
      );
      expect(
        WorksSuccess([kSampleWork]),
        isNot(equals(WorksSuccess([kSampleWork2]))),
      );
    });

    test('WorksFailure compares by its message', () {
      expect(const WorksFailure('a'), equals(const WorksFailure('a')));
      expect(
        const WorksFailure('a'),
        isNot(equals(const WorksFailure('b'))),
      );
    });

    test('distinct state types are never equal', () {
      expect(WorksInitial(), isNot(equals(WorksLoading())));
      expect(
        WorksLoading(),
        isNot(equals(const WorksFailure('boom'))),
      );
    });
  });
}
