import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class HeroTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Building digital",
        style: context.textTheme.displayMedium,
        children: [
          TextSpan(text: "\nworlds"),
          TextSpan(
            text: " beyond",
            style: TextStyle(
              color: context.colorScheme.primary,
              fontFamily: "Georgia",
              fontStyle: FontStyle.italic,
              fontWeight: .w500,
            ),
          ),
          TextSpan(text: "\nthe ordinary"),
          TextSpan(
            text: ".",
            style: TextStyle(color: context.colorScheme.primary),
          ),
        ],
      ),
    );
  }
}
