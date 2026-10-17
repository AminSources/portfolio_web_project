import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/theme/app_theme.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/hero_background.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/hero_title.dart';
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

                  TextDivider(text: "INDEPENDENT DEVELOPER"),
                  SizedBox(height: 15),

                  HeroTitle(),
                  SizedBox(height: 30),

                  txt(
                    "I turn complex ideas int thoughtful digital experiences - with clean code, purposeful design, and a little cosmic curiousity.",
                    style: context.textTheme.bodyLarge,
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 30),

                  //* button row
                  Wrap(
                    children: [
                      //* explore my work button
                      ElevatedButton.icon(
                        onPressed: () {},
                        label: txt(
                          "Explore my work",
                          color: context.colorScheme.onPrimary,
                          fontWeight: .bold,
                        ),
                        icon: Icon(Icons.arrow_outward_rounded),
                        iconAlignment: IconAlignment.end,
                      ),

                      //* More about me button
                      TextButton.icon(
                        onPressed: () {},
                        label: txt(
                          "More about me",
                          color: context.colorScheme.primary,
                          fontWeight: .bold,
                        ),
                        icon: Icon(Icons.arrow_outward_rounded),
                        iconAlignment: IconAlignment.end,
                      ),
                    ],
                  ),

                  Spacer(),

                  TextDivider(
                    text: "SCROLL TO EXPLORE",
                    textStyle: context.textTheme.labelMedium,
                  ),
                ],
              ),
            ),

            //* side text
            RotatedBox(
              quarterTurns: 1,
              child: Row(
                spacing: 10,
                mainAxisAlignment: .center,
                children: [
                  Icon(
                    Icons.circle_rounded,
                    color: context.colorScheme.primary,
                    size: 6,
                  ),

                  txt(
                    "THE EVENT HORIZON",
                    style: context.textTheme.labelMedium,
                    color: AppTheme.muted,
                  ),

                  Container(
                    width: 5,
                    height: 1,
                    color: context.colorScheme.primary,
                  ),

                  txt("01", style: context.textTheme.labelMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
