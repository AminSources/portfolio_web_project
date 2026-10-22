import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/theme/app_colors.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

class HeroSideLabel extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Row(
        spacing: 10,
        mainAxisAlignment: .center,
        children: [
          Icon(
            Icons.circle_rounded,
            color: context.colorScheme.primary,
            size: 6,
          ),

          txt(
            "THE EVENT HORIZON",
            style: context.textTheme.labelSmall,
            color: AppColors.muted,
          ),

          Container(width: 5, height: 1, color: context.colorScheme.primary),

          txt(
            "01",
            style: context.textTheme.labelSmall,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
