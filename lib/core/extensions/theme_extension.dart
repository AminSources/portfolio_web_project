import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/theme/app_fonts.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/core/theme/app_typography.dart';

extension ThemeExtension on BuildContext {
  //? get app theme data
  ThemeData get theme => AppTheme.appTheme;

  //? get app colorSheme
  ColorScheme get colorScheme => theme.colorScheme;

  //? get app text theme
  TextTheme get textTheme =>
      AppTypography(MediaQuery.sizeOf(this).width).textTheme;

  //? get app fonts
  String get mono => AppFonts.mono;
  String get serif => AppFonts.serif;
  String get sans => AppFonts.sans;
}
