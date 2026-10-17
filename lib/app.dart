import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/pages/portfolio_page.dart';

class App extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.appTheme,
          themeMode: ThemeMode.light,
          home: PortfolioPage(),
        ),
      ),
    );
  }
}
