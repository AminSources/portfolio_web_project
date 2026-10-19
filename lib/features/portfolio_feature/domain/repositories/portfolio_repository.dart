import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

abstract class PortfolioRepository {
  Future<DataState<List<WorkEntity>>> getWorks();
}
