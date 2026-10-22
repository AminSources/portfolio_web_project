import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/constants/app_lists.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/principle_item.dart';

class PrincipleList extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppLists.principleTitles.length,
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemBuilder: ((context, index) => PrincipleItem(
        count: (index + 1).toString().padLeft(2, "0"),
        title: AppLists.principleTitles[index],
        subtitle: AppLists.principleSubtitles[index],
      )),
    );
  }
}
