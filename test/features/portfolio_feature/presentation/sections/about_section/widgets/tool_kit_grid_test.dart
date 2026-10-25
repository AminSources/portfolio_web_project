import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/constants/app_lists.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/tool_kit_grid.dart';

void main() {
  testWidgets('renders one chip for each configured toolkit item', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.appTheme,
        home: const Scaffold(body: ToolKitGrid()),
      ),
    );

    for (final item in AppLists.toolkitList) {
      expect(find.text(item), findsOneWidget, reason: 'missing toolkit item: $item');
    }
    expect(find.byType(Text), findsNWidgets(AppLists.toolkitList.length));
  });
}
