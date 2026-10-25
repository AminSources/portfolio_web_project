import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/data_source/local/portfolio_datasources.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/models/work_model.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/repositories/portfolio_repository_impl.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

class FakePortfolioDatasources extends PortfolioDatasources {
  FakePortfolioDatasources({this.result, this.error});

  final dynamic result;
  final Object? error;

  @override
  Future<dynamic> getWorks() async {
    if (error != null) throw error!;
    return result;
  }
}

void main() {
  final recordOne = <String, dynamic>{
    'short_name': 'alpha',
    'used_technologies': 'flutter',
    'year': '2025',
    'title': 'Alpha',
    'description': 'Alpha description',
    'title_image_path': 'assets/alpha.webp',
    'project_url': 'https://example.com/alpha',
  };
  final recordTwo = <String, dynamic>{
    'short_name': 'beta',
    'used_technologies': 'python',
    'year': '2026',
    'title': 'Beta',
    'description': 'Beta description',
    'title_image_path': 'assets/beta.webp',
    'project_url': 'https://example.com/beta',
  };

  group('PortfolioRepositoryImpl.getWorks', () {
    test('converts source records to WorkModel instances in order', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(
          result: [recordOne, recordTwo],
        ),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataSuccess<List<WorkEntity>>>());
      final works = result.data!;
      expect(works, hasLength(2));
      expect(works[0], isA<WorkModel>());
      expect(works[0].shortName, 'alpha');
      expect(works[1].shortName, 'beta');
      expect(works[1].projectUrl, 'https://example.com/beta');
      expect(result.message, isNull);
    });

    test('returns a successful empty list when there are no records', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(result: <dynamic>[]),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataSuccess<List<WorkEntity>>>());
      expect(result.data, isEmpty);
    });

    test('converts data-source exceptions into DataFailure', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(
          error: StateError('asset unavailable'),
        ),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataFailure<List<WorkEntity>>>());
      expect(result.data, isNull);
      expect(result.message, startsWith('Could not get works data:'));
      expect(result.message, contains('asset unavailable'));
    });

    test('converts malformed records into DataFailure instead of throwing', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(
          result: [<String, dynamic>{'short_name': 'missing-fields'}],
        ),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataFailure<List<WorkEntity>>>());
      expect(result.message, startsWith('Could not get works data:'));
    });

    test('converts a non-iterable response into DataFailure', () async {
      final repository = PortfolioRepositoryImpl(
        portfolioDatasources: FakePortfolioDatasources(result: {'unexpected': 'object'}),
      );

      final result = await repository.getWorks();

      expect(result, isA<DataFailure<List<WorkEntity>>>());
    });
  });
}
