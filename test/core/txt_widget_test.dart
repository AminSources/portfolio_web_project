import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

import '../helpers/widget_harness.dart';

void main() {
  group('txt widget', () {
    testWidgets('renders the given text', (tester) async {
      await tester.pumpWidget(wrapWithApp(child: txt('Hello portfolio')));

      expect(find.text('Hello portfolio'), findsOneWidget);
    });

    testWidgets('applies explicit color, size and fontWeight', (tester) async {
      await tester.pumpWidget(
        wrapWithApp(
          child: txt(
            'styled',
            color: Colors.red,
            size: 33,
            fontWeight: FontWeight.w900,
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('styled'));
      expect(text.style!.color, Colors.red);
      expect(text.style!.fontSize, 33);
      expect(text.style!.fontWeight, FontWeight.w900);
    });

    testWidgets('respects maxLines and overflow', (tester) async {
      await tester.pumpWidget(
        wrapWithApp(
          child: SizedBox(
            width: 100,
            child: txt(
              'a very long line of text that cannot fit',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final text = tester.widget<Text>(
        find.text('a very long line of text that cannot fit'),
      );
      expect(text.maxLines, 1);
      expect(text.overflow, TextOverflow.ellipsis);
    });

    testWidgets('falls back to theme bodyMedium style when none given',
        (tester) async {
      const theme = ThemeData(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Color(0xFF123456)),
        ),
      );

      await tester.pumpWidget(
        wrapWithApp(child: txt('themed'), themeOverride: theme),
      );

      final text = tester.widget<Text>(find.text('themed'));
      expect(text.style!.color, const Color(0xFF123456));
    });
  });
}
