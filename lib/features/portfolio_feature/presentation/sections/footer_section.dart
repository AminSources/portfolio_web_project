import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/keys/navigation_keys.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/logo.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/outlined_icon_button.dart';

class FooterSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Logo(),

                  OutlinedIconButton(
                    onTap: () {
                      Scrollable.ensureVisible(
                        NavigationKeys.heroSectionKey.currentContext!,
                        duration: const Duration(milliseconds: 1250),
                        curve: Curves.easeInOutCubic,
                      );
                    },
                    icon: Icons.arrow_upward_rounded,
                  ),
                ],
              ),
              SizedBox(height: 20),

              txt(
                "© 2026 Mohammad Amin Farshbaf. All rights reserved.",
                style: context.textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
