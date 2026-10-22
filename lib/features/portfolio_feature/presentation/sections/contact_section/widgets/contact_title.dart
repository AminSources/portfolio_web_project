import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/theme/app_fonts.dart';

class ContactTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Let's make something",
        style: context.textTheme.displaySmall,
        children: [
          TextSpan(
            text: " matter.",
            style: TextStyle(
              color: context.colorScheme.primary,
              fontFamily: AppFonts.serif,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
