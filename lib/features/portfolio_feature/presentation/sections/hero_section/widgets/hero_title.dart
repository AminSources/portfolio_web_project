import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class HeroTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Mohammad Amin",
        style: context.textTheme.displayMedium,
        children: [
          TextSpan(
            text: " Farshbaf.",
            style: TextStyle(
              color: context.colorScheme.primary,
              fontFamily: context.serif,
              fontStyle: FontStyle.italic,
              fontWeight: .w500,
            ),
          ),
        ],
      ),
    );
  }
}
