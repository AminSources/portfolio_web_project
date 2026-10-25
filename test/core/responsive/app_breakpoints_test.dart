import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/theme/app_typography.dart';

void main() {
  group('AppBreakpoints', () {
    test('defines the mobile and tablet boundaries', () {
      expect(AppBreakpoints.mobile, 600);
      expect(AppBreakpoints.tablet, 1024);
      expect(AppBreakpoints.mobile, lessThan(AppBreakpoints.tablet));
    });
  });

  group('AppTypography device classification', () {
    test('classifies widths below 600 as mobile', () {
      for (final width in [320.0, 375.0, 599.9]) {
        final typography = AppTypography(width);
        expect(typography.isMobile, isTrue, reason: 'width=$width');
        expect(typography.isTablet, isFalse, reason: 'width=$width');
      }
    });

    test('classifies the 600-to-1023.9 range as tablet', () {
      for (final width in [600.0, 768.0, 1023.9]) {
        final typography = AppTypography(width);
        expect(typography.isMobile, isFalse, reason: 'width=$width');
        expect(typography.isTablet, isTrue, reason: 'width=$width');
      }
    });

    test('classifies widths at and above 1024 as desktop', () {
      for (final width in [1024.0, 1366.0, 1920.0]) {
        final typography = AppTypography(width);
        expect(typography.isMobile, isFalse, reason: 'width=$width');
        expect(typography.isTablet, isFalse, reason: 'width=$width');
      }
    });
  });
}
