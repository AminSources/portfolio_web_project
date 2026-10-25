import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/data_source/local/portfolio_datasources.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';

/// A sample [WorkEntity] used across the test suite.
const kSampleWork = WorkEntity(
  shortName: 'hamsafar',
  usedTechnologies: 'mobile - flutter',
  year: '2026',
  title: 'Hamsafar-Coordinate travel',
  description: 'A Flutter application to coordinate trips.',
  titleImagePath: 'lib/assets/images/hamsafar.webp',
  projectUrl: 'https://github.com/aminsources/hamsafar',
);

/// Second sample work with different values (used for Equatable checks).
const kSampleWork2 = WorkEntity(
  shortName: 'portfolio web',
  usedTechnologies: 'web - flutter',
  year: '2026',
  title: 'Aminsources-Portfolio web',
  description: 'A responsive portfolio web.',
  titleImagePath: 'lib/assets/images/portfolio.webp',
  projectUrl: 'https://github.com/aminsources/portfolio_web_project',
);

/// Fake data source that returns whatever [response] is set to.
class FakePortfolioDatasources extends PortfolioDatasources {
  dynamic response;
  Object? error;

  FakePortfolioDatasources({this.response, this.error});

  @override
  Future<dynamic> getWorks() async {
    if (error != null) throw error!;
    return response;
  }
}

/// Fake repository that returns a pre-configured [DataState].
class FakePortfolioRepository extends PortfolioRepository {
  final DataState<List<WorkEntity>> result;

  int callCount = 0;

  FakePortfolioRepository(this.result);

  @override
  Future<DataState<List<WorkEntity>>> getWorks() async {
    callCount++;
    return result;
  }
}
