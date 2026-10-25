import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

void main() {
  Widget buildSubject(Widget child) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
        ),
      ),
      home: Scaffold(body: Center(child: child)),
    );
  }

  group('txt', () {
    testWidgets('renders the supplied string', (tester) async {
      await tester.pumpWidget(buildSubject(const txt('Hello portfolio')));

      expect(find.text('Hello portfolio'), findsOneWidget);
    });

    testWidgets('applies explicit size, color, and font family', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          const txt(
            'Styled text',
            size: 22,
            color: Colors.orange,
            fontFamily: 'Georgia',
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Styled text'));
      expect(text.style!.fontSize, 22);
      expect(text.style!.color, Colors.orange);
      expect(text.style!.fontFamily, 'Georgia');
    });

    testWidgets('merges the supplied TextStyle with the app body style', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          const txt(
            'Merged text',
            style: TextStyle(fontWeight: FontWeight.w700, letterSpacing: 1.5),
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Merged text'));
      expect(text.style!.fontSize, 14);
      expect(text.style!.color, Colors.black);
      expect(text.style!.fontWeight, FontWeight.w700);
      expect(text.style!.letterSpacing, 1.5);
    });

    testWidgets('forwards alignment, line count, and overflow', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          const txt(
            'A deliberately long piece of text',
            textAlign: TextAlign.justify,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('A deliberately long piece of text'));
      expect(text.textAlign, TextAlign.justify);
      expect(text.maxLines, 2);
      expect(text.overflow, TextOverflow.ellipsis);
    });

    testWidgets('allows caller overrides to replace properties in style', (tester) async {
      await tester.pumpWidget(
        buildSubject(
          const txt(
            'Override',
            style: TextStyle(color: Colors.blue, fontSize: 10),
            color: Colors.red,
            size: 18,
          ),
        ),
      );

      final text = tester.widget<Text>(find.text('Override'));
      expect(text.style!.color, Colors.red);
      expect(text.style!.fontSize, 18);
    });
  });
}
