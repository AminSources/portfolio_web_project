import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';

class FakePortfolioRepository implements PortfolioRepository {
  FakePortfolioRepository(this.result);

  final DataState<List<WorkEntity>> result;
  int getWorksCallCount = 0;

  @override
  Future<DataState<List<WorkEntity>>> getWorks() async {
    getWorksCallCount++;
    return result;
  }
}

void main() {
  final work = WorkEntity(
    shortName: 'demo',
    usedTechnologies: 'flutter',
    year: '2026',
    title: 'Demo',
    description: 'A demo project',
    titleImagePath: 'assets/demo.webp',
    projectUrl: 'https://example.com/demo',
  );

  group('GetWorksUsecase', () {
    test('delegates to the repository and returns its success state', () async {
      final expected = DataSuccess<List<WorkEntity>>([work]);
      final repository = FakePortfolioRepository(expected);
      final usecase = GetWorksUsecase(portfolioRepository: repository);

      final result = await usecase(null);

      expect(repository.getWorksCallCount, 1);
      expect(result, same(expected));
      expect(result.data, [work]);
    });

    test('propagates repository failures without rewriting them', () async {
      final expected = DataFailure<List<WorkEntity>>('File not found');
      final repository = FakePortfolioRepository(expected);
      final usecase = GetWorksUsecase(portfolioRepository: repository);

      final result = await usecase(null);

      expect(repository.getWorksCallCount, 1);
      expect(result, same(expected));
      expect(result.message, 'File not found');
      expect(result.data, isNull);
    });
  });
}
