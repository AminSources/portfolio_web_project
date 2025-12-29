import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* github
        IconButton(
          onPressed: () {
            //? launch url
            launchUrl(Uri.parse("https://github.com/AminSources"));
          },
          icon: Icon(FeatherIcons.github),
        ),

        //* instagram
        IconButton(
          onPressed: () {
            //? launch url
            launchUrl(Uri.parse("https://www.instagram.com/m_amin_farshbaf/"));
          },
          icon: Icon(FeatherIcons.instagram),
        ),

        //* telegram
        IconButton(
          onPressed: () {
            //? launch url
            launchUrl(Uri.parse("https://t.me/iAmin_com"));
          },
          icon: Icon(FeatherIcons.send),
        ),
      ],
    );
  }
}
