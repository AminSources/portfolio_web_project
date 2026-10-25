import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/footer_section.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section/widgets/hero_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/section_kicker.dart';

import '../../helpers/widget_harness.dart';

void main() {
  group('SectionKicker', () {
    testWidgets('renders "pageCount / PAGE NAME" in uppercase', (tester) async {
      await tester.pumpWidget(
        wrapWithApp(
          child: SectionKicker(
            pageCount: '03',
            pageName: 'selected works',
            pageBio: 'a few things brought into orbit',
          ),
        ),
      );

      expect(find.text('03 / SELECTED WORKS'), findsOneWidget);
    });

    testWidgets('renders the bio text uppercased', (tester) async {
      await tester.pumpWidget(
        wrapWithApp(
          child: SectionKicker(
            pageCount: '02',
            pageName: 'about',
            pageBio: 'hello world',
          ),
        ),
      );

      expect(find.text('HELLO WORLD'), findsOneWidget);
    });

    testWidgets('defaults pageBio to empty string when omitted',
        (tester) async {
      await tester.pumpWidget(
        wrapWithApp(
          child: SectionKicker(pageCount: '01', pageName: 'hero'),
        ),
      );

      // Should build without throwing despite the optional bio.
      expect(find.text('01 / HERO'), findsOneWidget);
    });
  });

  group('FooterSection', () {
    testWidgets('shows the copyright line', (tester) async {
      await tester.pumpWidget(
        wrapWithApp(child: SingleChildScrollView(child: FooterSection())),
      );

      expect(
        find.text('© 2026 Mohammad Amin Farshbaf. All rights reserved.'),
        findsOneWidget,
      );
    });

    testWidgets('shows the logo avatar', (tester) async {
      await tester.pumpWidget(
        wrapWithApp(child: SingleChildScrollView(child: FooterSection())),
      );

      expect(find.text('A.'), findsOneWidget);
    });
  });

  group('HeroTitle', () {
    testWidgets('renders the full name as rich text', (tester) async {
      await tester.pumpWidget(wrapWithApp(child: HeroTitle()));

      final richText = tester.widget<RichText>(find.byType(RichText).first);
      final span = richText.text as TextSpan;
      final plain = span.toPlainText();

      expect(plain, 'Mohammad Amin Farshbaf.');
    });
  });
}
