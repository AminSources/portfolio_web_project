import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/works_grid.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/works_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/section_kicker.dart';

class WorksSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.voidSoft,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          //* header section
          SectionKicker(
            pageCount: "03",
            pageName: "selected works",
            pageBio: "A FEW THINGS BROUGHT INTO ORBIT",
          ),
          SizedBox(height: 20),

          //* title section
          WorksTitle(),
          SizedBox(height: 20),

          txt(
            "A selection of experiments and projects. Replace these cards with your own work.",
            style: context.textTheme.bodyMedium,
          ),

          //* works grid
          WorksGrid(),
          SizedBox(height: 20),

          //* footer section
          txt(
            "✳ MORE PROJECTS ARE ALWAYS IN MOTION.",
            style: context.textTheme.labelSmall,
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
