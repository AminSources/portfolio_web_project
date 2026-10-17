import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class ContactTitle extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Let's make\nsomething",
        style: context.textTheme.displaySmall,
        children: [
          TextSpan(
            text: "\nmatter.",
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
