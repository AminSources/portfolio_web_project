import 'package:get_it/get_it.dart';
import 'package:personal_page/core/bloc/theme_bloc/theme_bloc.dart';

//* Service Locator
GetIt locator = GetIt.instance;

void setup() {
  //? blocs
  //* theme bloc
  locator.registerSingleton<ThemeBloc>(ThemeBloc());
}
