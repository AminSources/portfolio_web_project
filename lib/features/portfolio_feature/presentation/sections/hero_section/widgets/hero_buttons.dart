import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_web_project/core/constants/app_urls.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/keys/navigation_keys.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:url_launcher/url_launcher.dart';

class HeroButtons extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 20,
      runSpacing: 20,
      children: [
        //* explore my work button
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              //? scroll to works section
              Scrollable.ensureVisible(
                NavigationKeys.workSectionKey.currentContext!,
                duration: const Duration(milliseconds: 1250),
                curve: Curves.easeInOutCubic,
              );
            },
            child: txt(
              "Explore my work",
              style: context.textTheme.labelLarge,
              color: context.colorScheme.onPrimary,
            ),
          ),
        ),

        //* More about me button
        SizedBox(
          height: 40,
          child: TextButton(
            onPressed: () {
              Scrollable.ensureVisible(
                NavigationKeys.aboutSectionKey.currentContext!,
                duration: const Duration(milliseconds: 1250),
                curve: Curves.easeInOutCubic,
              );
            },
            child: txt(
              "More about me",
              style: context.textTheme.labelLarge,
              color: context.colorScheme.primary,
            ),
          ),
        ),

        //* github button
        SizedBox(
          width: 40,
          height: 40,
          child: Material(
            type: MaterialType.transparency,
            child: Ink(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: context.colorScheme.primary),
              ),
              child: InkWell(
                onTap: () => launchUrl(Uri.parse(AppUrls.githubUrl)),
                child: SvgPicture.asset(
                  "lib/assets/images/github.svg",
                  colorFilter: ColorFilter.mode(
                    context.colorScheme.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
