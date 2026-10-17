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
      children: [
        //* explore my work button
        ElevatedButton.icon(
          onPressed: () {
            //? scroll to works section
            Scrollable.ensureVisible(
              NavigationKeys.workSectionKey.currentContext!,
              duration: const Duration(milliseconds: 1250),
              curve: Curves.easeInOutCubic,
            );
          },
          label: txt(
            "Explore my work",
            style: context.textTheme.labelLarge,
            color: context.colorScheme.onPrimary,
          ),
          icon: Icon(Icons.arrow_outward_rounded),
          iconAlignment: IconAlignment.end,
        ),

        //* More about me button
        TextButton.icon(
          onPressed: () {
            Scrollable.ensureVisible(
              NavigationKeys.aboutSectionKey.currentContext!,
              duration: const Duration(milliseconds: 1250),
              curve: Curves.easeInOutCubic,
            );
          },
          label: txt(
            "More about me",
            style: context.textTheme.labelLarge,
            color: context.colorScheme.primary,
          ),
          icon: Icon(Icons.arrow_outward_rounded),
          iconAlignment: IconAlignment.end,
        ),

        //* github button
        InkWell(
          onTap: () => launchUrl(Uri.parse(AppUrls.githubUrl)),
          child: SvgPicture.asset(
            "lib/assets/images/github.svg",
            colorFilter: ColorFilter.mode(
              context.colorScheme.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
