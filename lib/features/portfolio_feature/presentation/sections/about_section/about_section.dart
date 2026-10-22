import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/about_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/about_title_image.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/principle_list.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/principle_table.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/tool_kit_grid.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/section_kicker.dart';

class AboutSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.all(20.w),

          child: Column(
            children: [
              //* header section
              SectionKicker(
                pageCount: "02",
                pageName: "about",
                pageBio: "A LITTLE CONTEXT, A LOT OF CURIOSITY",
              ),
              SizedBox(height: 20),

              Column(
                crossAxisAlignment: .start,
                children: [
                  _aboutTitle(context, constraints.maxWidth),

                  if (constraints.maxWidth < AppBreakpoints.mobile) ...[
                    Divider(),
                  ],

                  //* principle list
                  constraints.maxWidth < AppBreakpoints.mobile
                      ? Column(children: [PrincipleList(), Divider()])
                      : PrincipleTable(),
                  SizedBox(height: 30),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _aboutTitle(BuildContext context, double width) {
  if (width < AppBreakpoints.mobile) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        //* title section
        AboutTitleImage(),
        SizedBox(height: 30),

        txt("WHO I AM", style: context.textTheme.labelMedium),
        SizedBox(height: 20),

        AboutTitle(),
        SizedBox(height: 20),

        //* intro section
        txt(
          "I’m Amin, a developer who enjoys making the digital feel simple, useful, and memorable.",
          style: context.textTheme.headlineSmall,
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),

        txt(
          "I work where logic meets visual craft: building responsive interfaces, exploring new technologies, and refining the small details that make a product feel right. I believe good work should be clear in purpose and precise in execution.",
          style: context.textTheme.bodyMedium,
          textAlign: TextAlign.justify,
        ),
        SizedBox(height: 20),

        Divider(),

        //* tool kit section
        txt("CURRENT TOOL KIT", style: context.textTheme.labelSmall),
        SizedBox(height: 20),

        ToolKitGrid(),
        SizedBox(height: 30),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: .spaceEvenly,
      crossAxisAlignment: .start,
      spacing: 20.w,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              txt("WHO I AM", style: context.textTheme.labelMedium),
              SizedBox(height: 20),

              AboutTitle(),
              SizedBox(height: 20),
            ],
          ),
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              AboutTitleImage(width: 200),
              SizedBox(height: 30),

              //* intro section
              txt(
                "I’m Amin, a developer who enjoys making the digital feel simple, useful, and memorable.",
                style: context.textTheme.headlineSmall,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              txt(
                "I work where logic meets visual craft: building responsive interfaces, exploring new technologies, and refining the small details that make a product feel right. I believe good work should be clear in purpose and precise in execution.",
                style: context.textTheme.bodyMedium,
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 20),

              Divider(),

              //* tool kit section
              txt("CURRENT TOOL KIT", style: context.textTheme.labelSmall),
              SizedBox(height: 20),

              ToolKitGrid(),
              SizedBox(height: 30),
            ],
          ),
        ),
      ],
    );
  }
}
