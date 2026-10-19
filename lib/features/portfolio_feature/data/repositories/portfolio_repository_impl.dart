import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/data_source/local/portfolio_datasources.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/models/work_model.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl extends PortfolioRepository {
  final PortfolioDatasources portfolioDatasources;

  new({required this.portfolioDatasources});

  @override
  Future<DataState<List<WorkEntity>>> getWorks() async {
    try {
      //? get works data from data source
      final response = await portfolioDatasources.getWorks();

      //? cast works data to work entity
      List<WorkEntity> works = [];
      for (var work in response) {
        works.add(WorkModel.fromJson(work));
      }

      return DataSuccess(works);
    } catch (e) {
      return DataFailure("Could not get works data: $e");
    }
  }
}
