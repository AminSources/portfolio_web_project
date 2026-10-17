import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/contact_section/widgets/contact_grid.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/contact_section/widgets/contact_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/section_kicker.dart';

class ContactSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          //* header section
          SectionKicker(
            pageCount: "04",
            pageName: "contact",
            pageBio: "HAVE SOMETHING IN MIND?",
          ),
          SizedBox(height: 30),

          txt("✳ OPEN TO GOOD IDEAS", style: context.textTheme.labelSmall),
          SizedBox(height: 20),

          //* title section
          ContactTitle(),
          SizedBox(height: 20),

          txt(
            "Have a project, an opportunity, or an interesting idea? My inbox is open.",
            style: context.textTheme.bodyMedium,
          ),
          SizedBox(height: 20),

          //* button section
          ElevatedButton.icon(
            onPressed: () {},
            label: txt(
              "Start a conversation",
              color: context.colorScheme.onPrimary,
              style: context.textTheme.labelLarge,
            ),
            icon: Icon(Icons.arrow_outward_rounded),
            iconAlignment: IconAlignment.end,
          ),
          SizedBox(height: 30),

          Divider(),

          //* contact section
          ContactGrid(),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
