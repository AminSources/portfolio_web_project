import 'package:get_it/get_it.dart';
import 'package:personal_page/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:personal_page/futures/home_future/data/data_source/remote/api_provider.dart';
import 'package:personal_page/futures/home_future/data/repositories/project_repository_impl.dart';
import 'package:personal_page/futures/home_future/domain/repositories/project_repository.dart';
import 'package:personal_page/futures/home_future/domain/usecase/project_usecase.dart';
import 'package:personal_page/futures/home_future/presentation/bloc/project_bloc.dart';

//* Service Locator
GetIt locator = GetIt.instance;

void setup() {
  //* api provider
  ApiProvider apiProvider = ApiProvider();

  //? repositories
  //* project repository
  locator.registerSingleton<ProjectRepository>(
    ProjectRepositoryImpl(apiProvider),
  );

  //? usecases
  //* project usecase
  locator.registerSingleton<ProjectUsecase>(ProjectUsecase(locator()));

  //? blocs
  //* theme bloc
  locator.registerSingleton<ThemeBloc>(ThemeBloc());

  //* project bloc
  locator.registerSingleton<ProjectBloc>(ProjectBloc(locator()));
}
