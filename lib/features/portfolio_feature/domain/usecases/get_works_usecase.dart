import 'package:portfolio_web_project/core/resources/data_state.dart';
import 'package:portfolio_web_project/core/usecase/usecase.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';

class GetWorksUsecase implements Usecase<DataState<List<WorkEntity>>, Null> {
  final PortfolioRepository portfolioRepository;

  new({required this.portfolioRepository});

  @override
  Future<DataState<List<WorkEntity>>> call(Null params) {
    return portfolioRepository.getWorks();
  }
}
