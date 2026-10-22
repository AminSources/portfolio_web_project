import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section/widgets/hero_background.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section/widgets/hero_buttons.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section/widgets/hero_side_label.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section/widgets/hero_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/text_divider.dart';

class HeroSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return HeroBackground(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              spacing: 25,
              children: [
                SizedBox(
                  width: getHeroTitleWidth(constraints.maxWidth),
                  child: Column(
                    mainAxisAlignment: .center,
                    crossAxisAlignment: .start,
                    children: [
                      Spacer(),

                      //* section title
                      TextDivider(text: "INDEPENDENT DEVELOPER"),
                      SizedBox(height: 15),

                      HeroTitle(),
                      SizedBox(height: 30),

                      //* section subtitle
                      txt(
                        "I turn complex ideas int thoughtful digital experiences - with clean code, purposeful design, and a little cosmic curiousity.",
                        style: context.textTheme.bodyLarge,
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 30),

                      //* section buttons
                      HeroButtons(),

                      Spacer(),

                      //* section footer
                      TextDivider(
                        text: "SCROLL TO EXPLORE",
                        textStyle: context.textTheme.labelSmall,
                      ),
                    ],
                  ),
                ),

                //* side text
                HeroSideLabel(),
              ],
            ),
          ),
        );
      },
    );
  }
}

double getHeroTitleWidth(double width) {
  if (width < AppBreakpoints.mobile) {
    return 260.w;
  }
  if (width >= AppBreakpoints.mobile && width < AppBreakpoints.tablet) {
    return 180.w;
  }
  if (width >= AppBreakpoints.tablet) {
    return 120.w;
  }
  return 250.w;
}
