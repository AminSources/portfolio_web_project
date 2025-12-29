import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/bloc/theme_bloc/theme_bloc.dart';
import 'package:personal_page/core/configs/app_theme.dart';
import 'package:personal_page/core/routes/routes.dart';
import 'package:personal_page/locator.dart';

void main() {
  //? init locator
  setup();

  //? run app
  runApp(
    MultiBlocProvider(
      providers: [
        //* theme bloc provider
        BlocProvider<ThemeBloc>(create: (context) => locator<ThemeBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          //* App theme data
          final AppTheme appTheme = AppTheme();

          //* App routes
          final Routes appRoutes = Routes();

          // app
          return MaterialApp(
            title: "M. Amin .F Portfolio",
            debugShowCheckedModeBanner: false,
            theme: appTheme.lightTheme,
            darkTheme: appTheme.darkTheme,
            themeMode: context.watch<ThemeBloc>().state.themeMode,
            routes: appRoutes.routes,
            initialRoute: "/",
          );
        },
      ),
    );
  }
}
