import 'package:get_it/get_it.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/data_source/local/portfolio_datasources.dart';
import 'package:portfolio_web_project/features/portfolio_feature/data/repositories/portfolio_repository_impl.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/repositories/portfolio_repository.dart';
import 'package:portfolio_web_project/features/portfolio_feature/domain/usecases/get_works_usecase.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';

final GetIt sl = GetIt.instance;

void setup() {
  //? register data sources
  sl.registerLazySingleton<PortfolioDatasources>(() => PortfolioDatasources());

  //? register repositories
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(
      portfolioDatasources: sl<PortfolioDatasources>(),
    ),
  );

  //? register usecases
  sl.registerLazySingleton<GetWorksUsecase>(
    () => GetWorksUsecase(portfolioRepository: sl<PortfolioRepository>()),
  );

  //? register bloc
  sl.registerLazySingleton<WorksBloc>(
    () => WorksBloc(getWorksUsecase: sl<GetWorksUsecase>()),
  );
}
