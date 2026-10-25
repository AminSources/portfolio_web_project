import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/drawer_body.dart';

Future<void> pumpAppBarAtWidth(WidgetTester tester, double width) async {
  tester.view.devicePixelRatio = 1;
  tester.view.physicalSize = Size(width, 900);
  addTearDown(() {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
  });
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(1440, 900),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.appTheme,
        home: Scaffold(
          drawer: const DrawerBody(),
          body: const CustomAppBar(),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();
}

void main() {
  group('CustomAppBar responsive navigation', () {
    testWidgets('shows a menu icon and hides inline navigation on mobile', (tester) async {
      await pumpAppBarAtWidth(tester, 375);

      expect(find.byIcon(Icons.menu_rounded), findsOneWidget);
      expect(find.text('Home'), findsNothing);
      expect(find.text('About'), findsNothing);
      expect(find.text('Available for work'), findsNothing);
    });

    testWidgets('shows inline navigation but not work status on tablet', (tester) async {
      await pumpAppBarAtWidth(tester, 800);

      expect(find.byIcon(Icons.menu_rounded), findsNothing);
      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Works'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
      expect(find.text('Available for work'), findsNothing);
    });

    testWidgets('shows navigation and work status on desktop', (tester) async {
      await pumpAppBarAtWidth(tester, 1200);

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('Available for work'), findsOneWidget);
    });

    testWidgets('mobile menu tap opens the scaffold drawer', (tester) async {
      await pumpAppBarAtWidth(tester, 375);

      await tester.tap(find.byIcon(Icons.menu_rounded));
      await tester.pumpAndSettle();

      expect(find.text('Home'), findsOneWidget);
      expect(find.text('About'), findsOneWidget);
      expect(find.text('Contact'), findsOneWidget);
    });
  });
}
