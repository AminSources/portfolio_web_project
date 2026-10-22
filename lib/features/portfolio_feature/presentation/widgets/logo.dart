import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/theme/app_typography.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

class Logo extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        //* avatar
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: context.colorScheme.primary),
          ),
          child: Center(
            child: txt(
              "A.",
              color: context.colorScheme.primary,
              size: 14,
              fontWeight: FontWeight.bold,
              fontFamily: "Georgia",
            ),
          ),
        ),

        //* name
        RichText(
          text: TextSpan(
            text: "AMIN",
            style: AppTypography.brandStyle,
            children: [
              TextSpan(
                text: " / DEVELOPER",
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
