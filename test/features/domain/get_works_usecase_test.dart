import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';

import '../../helpers/fakes.dart';

void main() {
  group('GetWorksUsecase', () {
    test('delegates to the repository and returns its DataSuccess', () async {
      final repository = FakePortfolioRepository(
        DataSuccess([kSampleWork, kSampleWork2]),
      );
      final usecase = GetWorksUsecase(portfolioRepository: repository);

      final result = await usecase(null);

      expect(repository.callCount, 1);
      expect(result, isA<DataSuccess<List<dynamic>>>());
      expect(result.data, [kSampleWork, kSampleWork2]);
      expect(result.message, isNull);
    });

    test('propagates a DataFailure from the repository', () async {
      final repository =
          FakePortfolioRepository(DataFailure<List<dynamic>>('no data'));
      final usecase = GetWorksUsecase(portfolioRepository: repository);

      final result = await usecase(null);

      expect(result, isA<DataFailure<List<dynamic>>>());
      expect(result.message, 'no data');
      expect(result.data, isNull);
    });

    test('implements the Usecase contract', () {
      final usecase = GetWorksUsecase(
        portfolioRepository:
            FakePortfolioRepository(DataSuccess<List<dynamic>>([])),
      );

      expect(usecase, isA<Usecase<DataState<List<dynamic>>, Null>>());
    });
  });
}
