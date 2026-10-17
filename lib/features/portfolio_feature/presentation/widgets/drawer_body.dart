import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/keys/navigation_keys.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/drawer_background.dart';

class DrawerBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerBackground(
      child: Column(
        children: [
          //* drawer button list
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                //? close drawer
                Navigator.pop(context);

                //? scroll to target section
                Scrollable.ensureVisible(
                  [
                    NavigationKeys.heroSectionKey.currentContext!,
                    NavigationKeys.aboutSectionKey.currentContext!,
                    NavigationKeys.workSectionKey.currentContext!,
                    NavigationKeys.contactSectionKey.currentContext!,
                  ][index],
                  duration: const Duration(milliseconds: 1250),
                  curve: Curves.easeInOutCubic,
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: .start,
                  children: [
                    SizedBox(),

                    txt(
                      ["Home", "About", "Works", "Contact"][index],
                      style: context.textTheme.labelLarge,
                      color: context.colorScheme.primary,
                    ),

                    if (index != 3) ...[Divider(height: 1)],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
