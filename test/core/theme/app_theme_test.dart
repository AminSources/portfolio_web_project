import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/theme/app_colors.dart';
import 'package:portfolio_web_project/core/theme/app_fonts.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/core/theme/app_typography.dart';

void main() {
  group('AppTheme', () {
    test('uses a dark Material 3 theme with the portfolio palette', () {
      final theme = AppTheme.appTheme;

      expect(theme.useMaterial3, isTrue);
      expect(theme.brightness, Brightness.dark);
      expect(theme.scaffoldBackgroundColor, const Color(0xFF090908));
      expect(theme.colorScheme.brightness, Brightness.dark);
      expect(theme.colorScheme.primary, AppColors.primary);
      expect(theme.colorScheme.secondary, AppColors.secondary);
      expect(theme.colorScheme.surface, AppColors.surface);
      expect(theme.colorScheme.onSurface, AppColors.onSurface);
      expect(theme.dividerColor, AppColors.line);
    });

    test('configures the elevated button colors consistently', () {
      final style = AppTheme.appTheme.elevatedButtonTheme.style!;

      expect(style.backgroundColor!.resolve(const {}), AppColors.primary);
      expect(style.foregroundColor!.resolve(const {}), AppColors.onPrimary);
      expect(style.elevation!.resolve(const {}), 0);
    });

    test('configures text buttons to use the primary color', () {
      final style = AppTheme.appTheme.textButtonTheme.style!;

      expect(style.foregroundColor!.resolve(const {}), AppColors.primary);
    });
  });

  group('AppFonts', () {
    test('exposes the three configured font-family names', () {
      expect(AppFonts.sans, 'Manrope');
      expect(AppFonts.serif, 'Georgia');
      expect(AppFonts.mono, 'DM Mono');
    });
  });

  group('AppTypography static text styles', () {
    test('brand and navigation styles use the expected font families', () {
      expect(AppTypography.brandStyle.fontFamily, AppFonts.sans);
      expect(AppTypography.navLinkStyle.fontFamily, AppFonts.sans);
      expect(AppTypography.serifItalic.fontFamily, AppFonts.serif);
      expect(AppTypography.serifItalic.fontStyle, FontStyle.italic);
      expect(AppTypography.buttonPrimaryStyle.color, AppColors.onPrimary);
    });
  });
}
