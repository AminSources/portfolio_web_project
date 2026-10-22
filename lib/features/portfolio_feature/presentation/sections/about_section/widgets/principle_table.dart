import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/constants/app_lists.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/principle_item.dart';

class PrincipleTable extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: context.theme.dividerColor);

    return Row(
      children: List.generate(
        AppLists.principleTitles.length,
        (index) => Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              border: Border(
                top: borderSide,
                left: index == 0 ? BorderSide.none : borderSide,
                right: index == 2 ? BorderSide.none : borderSide,
                bottom: borderSide,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: PrincipleItem(
                count: (index + 1).toString().padLeft(2, "0"),
                title: AppLists.principleTitles[index],
                subtitle: AppLists.principleSubtitles[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
