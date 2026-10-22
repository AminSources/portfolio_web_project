import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/outlined_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkItem extends StatelessWidget {
  final String imagePath;
  final String count;
  final String shortName;
  final String usedTechnologies;
  final String year;
  final String title;
  final String description;
  final String workUrl;
  final double? width;

  const new({
    super.key,
    required this.imagePath,
    required this.count,
    required this.shortName,
    required this.usedTechnologies,
    required this.year,
    required this.title,
    required this.description,
    required this.workUrl,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          children: [
            //* image section
            SizedBox(
              width: width,
              height: 200,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  //* image
                  Image.asset(imagePath, fit: .cover),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: txt(
                      "$count / ${shortName.toUpperCase()}",
                      style: context.textTheme.labelSmall,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),

            Row(
              spacing: 10,
              mainAxisAlignment: .spaceBetween,
              crossAxisAlignment: .end,
              children: [
                Expanded(
                  child: Column(
                    spacing: 5,
                    crossAxisAlignment: .start,
                    children: [
                      //* wokr info
                      txt(
                        "${usedTechnologies.toUpperCase()} · $year",
                        style: context.textTheme.labelSmall,
                      ),

                      txt(title, style: context.textTheme.titleLarge),

                      txt(description, style: context.textTheme.bodyMedium),
                    ],
                  ),
                ),

                OutlinedIconButton(
                  onTap: () {
                    //? open work page
                    launchUrl(Uri.parse(workUrl));
                  },
                  icon: Icons.arrow_outward_rounded,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
