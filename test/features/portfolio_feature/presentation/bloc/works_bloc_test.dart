import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';

class FakePortfolioRepository implements PortfolioRepository {
  FakePortfolioRepository(this.result);

  final DataState<List<WorkEntity>> result;
  int callCount = 0;

  @override
  Future<DataState<List<WorkEntity>>> getWorks() async {
    callCount++;
    return result;
  }
}

WorkEntity makeWork({String shortName = 'demo'}) {
  return WorkEntity(
    shortName: shortName,
    usedTechnologies: 'Flutter',
    year: '2026',
    title: 'Demo project',
    description: 'Description',
    titleImagePath: 'lib/assets/images/demo.webp',
    projectUrl: 'https://example.com/demo',
  );
}

void main() {
  group('WorksBloc', () {
    test('starts in WorksInitial', () async {
      final repository = FakePortfolioRepository(DataSuccess<List<WorkEntity>>([]));
      final bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
      );

      expect(bloc.state, isA<WorksInitial>());
      await bloc.close();
    });

    test('emits loading followed by success with the loaded projects', () async {
      final work = makeWork();
      final repository = FakePortfolioRepository(
        DataSuccess<List<WorkEntity>>([work]),
      );
      final bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
      );

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<WorksLoading>(),
          predicate<WorksState>(
            (state) =>
                state is WorksSuccess &&
                state.works.length == 1 &&
                state.works.single == work,
            'WorksSuccess with the fetched work',
          ),
        ]),
      );
      bloc.add(LoadWorkEvent());
      await expectation;

      expect(repository.callCount, 1);
      expect(bloc.state, isA<WorksSuccess>());
      await bloc.close();
    });

    test('emits loading followed by failure with the repository message', () async {
      final repository = FakePortfolioRepository(
        DataFailure<List<WorkEntity>>('Unable to read portfolio data'),
      );
      final bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
      );

      final expectation = expectLater(
        bloc.stream,
        emitsInOrder([
          isA<WorksLoading>(),
          predicate<WorksState>(
            (state) =>
                state is WorksFailure &&
                state.message == 'Unable to read portfolio data',
            'WorksFailure with the repository message',
          ),
        ]),
      );
      bloc.add(LoadWorkEvent());
      await expectation;

      expect(repository.callCount, 1);
      expect(bloc.state, isA<WorksFailure>());
      await bloc.close();
    });

    test('a new load event performs another repository request', () async {
      final repository = FakePortfolioRepository(DataSuccess<List<WorkEntity>>([]));
      final bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
      );

      final expectation = expectLater(
        bloc.stream,
        emitsInAnyOrder([
          isA<WorksLoading>(),
          isA<WorksLoading>(),
          isA<WorksSuccess>(),
          isA<WorksSuccess>(),
        ]),
      );
      bloc
        ..add(LoadWorkEvent())
        ..add(LoadWorkEvent());
      await expectation;

      expect(repository.callCount, 2);
      await bloc.close();
    });
  });

  group('WorksEvent and WorksState equality', () {
    test('identical event types are value-equal', () {
      expect(LoadWorkEvent(), equals(LoadWorkEvent()));
    });

    test('initial and loading states are value-equal by type', () {
      expect(WorksInitial(), equals(WorksInitial()));
      expect(WorksLoading(), equals(WorksLoading()));
      expect(WorksInitial(), isNot(equals(WorksLoading())));
    });

    test('success and failure states include their payload in equality', () {
      final first = makeWork();
      final second = makeWork(shortName: 'another');

      expect(WorksSuccess([first]), equals(WorksSuccess([first])));
      expect(WorksSuccess([first]), isNot(equals(WorksSuccess([second]))));
      expect(WorksFailure('offline'), equals(WorksFailure('offline')));
      expect(WorksFailure('offline'), isNot(equals(WorksFailure('timeout'))));
    });
  });
}
