import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/constants/app_lists.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/tool_kit_chip.dart';

class ToolKitGrid extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        AppLists.toolkitList.length,
        (index) => ToolKitChip(label: AppLists.toolkitList[index]),
      ),
    );
  }
}
