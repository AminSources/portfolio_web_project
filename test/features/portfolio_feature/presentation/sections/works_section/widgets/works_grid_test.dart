import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/works_grid.dart';

class CompleterPortfolioRepository implements PortfolioRepository {
  final Completer<DataState<List<WorkEntity>>> completer =
      Completer<DataState<List<WorkEntity>>>();

  @override
  Future<DataState<List<WorkEntity>>> getWorks() => completer.future;
}

class ImmediatePortfolioRepository implements PortfolioRepository {
  ImmediatePortfolioRepository(this.result);

  final DataState<List<WorkEntity>> result;

  @override
  Future<DataState<List<WorkEntity>>> getWorks() async => result;
}

void main() {
  group('WorksGrid states', () {
    testWidgets('shows a progress indicator while the request is pending', (
      tester,
    ) async {
      final repository = CompleterPortfolioRepository();

      final bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(portfolioRepository: repository),
      );

      try {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: BlocProvider.value(
                value: bloc,
                child: const WorksGrid(workItemWidth: 320),
              ),
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(CircularProgressIndicator), findsOneWidget);

        repository.completer.complete(DataFailure<List<WorkEntity>>('Offline'));

        await tester.pump();
        await tester.pump();

        expect(find.text('Offline'), findsOneWidget);
        expect(find.byType(CircularProgressIndicator), findsNothing);
      } finally {
        await tester.pumpWidget(const SizedBox.shrink());

        await tester.runAsync(() async {
          await bloc.close().timeout(const Duration(seconds: 3));
        });
      }
    });

    testWidgets('renders the repository error message on failure', (
      tester,
    ) async {
      final bloc = WorksBloc(
        getWorksUsecase: GetWorksUsecase(
          portfolioRepository: ImmediatePortfolioRepository(
            DataFailure<List<WorkEntity>>('Portfolio data could not be loaded'),
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider.value(
              value: bloc,
              child: const WorksGrid(workItemWidth: 320),
            ),
          ),
        ),
      );

      await tester.pump();
      await tester.pump();

      expect(find.text('Portfolio data could not be loaded'), findsOneWidget);

      await tester.pumpWidget(const SizedBox.shrink());

      await tester.runAsync(() async {
        await bloc.close().timeout(const Duration(seconds: 3));
      });
    });
  });
}
