import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class WorksTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Selected ",
        style: context.textTheme.displaySmall,
        children: [
          TextSpan(
            text: "work.",
            style: TextStyle(
              color: context.colorScheme.primary,
              fontFamily: "Georgia",
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
