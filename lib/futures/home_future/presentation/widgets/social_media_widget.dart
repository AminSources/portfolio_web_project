import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class SocialMediaWidget extends StatelessWidget {
  const SocialMediaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* github
        IconButton(onPressed: () {}, icon: Icon(FeatherIcons.github)),

        //* instagram
        IconButton(onPressed: () {}, icon: Icon(FeatherIcons.instagram)),

        //* telegram
        IconButton(onPressed: () {}, icon: Icon(FeatherIcons.send)),
      ],
    );
  }
}
