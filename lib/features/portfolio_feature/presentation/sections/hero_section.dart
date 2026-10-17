import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
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
            ),
            SizedBox(height: 30),

            //* button row
            Row(
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
    );
  }
}
