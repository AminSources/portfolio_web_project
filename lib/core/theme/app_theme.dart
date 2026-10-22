import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/theme/app_colors.dart';

class AppTheme {
  AppTheme._();

  static const Brightness brightness = Brightness.dark;

  static ThemeData get appTheme => ThemeData(
    useMaterial3: true,
    brightness: brightness,
    scaffoldBackgroundColor: const Color(0xFF090908), // --void
    colorScheme: const ColorScheme(
      brightness: brightness,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      error: AppColors.error,
      onError: AppColors.onError,
      surface: AppColors.surface,
      onSurface: AppColors.onSurface,
    ),
    dividerColor: AppColors.line,
    hintColor: AppColors.dim,

    //* widgets theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primary),
        foregroundColor: WidgetStatePropertyAll(AppColors.onPrimary),
        elevation: WidgetStatePropertyAll(0),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
        iconColor: WidgetStatePropertyAll(AppColors.onPrimary),
      ),
    ),

    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStatePropertyAll(AppColors.primary),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder()),
      ),
    ),

    dividerTheme: DividerThemeData(color: AppColors.line),
  );
}
