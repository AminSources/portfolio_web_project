import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
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
    return HeroBackground(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          spacing: 25,
          children: [
            Expanded(
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
  }
}
