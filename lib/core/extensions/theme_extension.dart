import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';

extension ThemeExtension on BuildContext {
  //? get app theme data
  ThemeData get theme => AppTheme.appTheme;

  //? get app colorSheme
  ColorScheme get colorScheme => theme.colorScheme;

  //? get app text theme
  TextTheme get textTheme => theme.textTheme;
}
