import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class AboutTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Curious by",
        style: context.textTheme.displaySmall,
        children: [
          TextSpan(text: " nature."),
          TextSpan(
            text: " Builder",
            style: TextStyle(
              color: context.colorScheme.primary,
              fontFamily: context.serif,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
          TextSpan(text: " by choice."),
        ],
      ),
    );
  }
}
