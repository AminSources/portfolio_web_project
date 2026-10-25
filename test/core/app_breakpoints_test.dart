import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';

void main() {
  group('AppBreakpoints', () {
    test('mobile breakpoint is 600', () {
      expect(AppBreakpoints.mobile, 600);
    });

    test('tablet breakpoint is 1024', () {
      expect(AppBreakpoints.tablet, 1024);
    });

    test('tablet breakpoint is greater than mobile breakpoint', () {
      expect(AppBreakpoints.tablet, greaterThan(AppBreakpoints.mobile));
    });
  });
}
