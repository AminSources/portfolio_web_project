import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/constants/app_urls.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/contact_section/widgets/labeled_column.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactGrid extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 10,
        runSpacing: 10,
        children: [
          LabeledColumn(
            title: "email",
            child: InkWell(
              onTap: () => launchUrl(Uri.parse(AppUrls.emailUrl)),
              child: txt(
                "helloamin.com@gmail.com",
                style: context.textTheme.bodyLarge,
              ),
            ),
          ),

          LabeledColumn(
            title: "elsewhere",
            child: Row(
              mainAxisSize: .min,
              spacing: 10,
              children: List.generate(
                3,
                (index) => InkWell(
                  onTap: () => launchUrl(
                    Uri.parse(
                      [
                        AppUrls.githubUrl,
                        AppUrls.instagramUrl,
                        AppUrls.telegramUrl,
                      ][index],
                    ),
                  ),
                  child: Row(
                    children: [
                      txt(
                        ["Github", "Instagram", "Telegram"][index],
                        style: context.textTheme.bodyLarge,
                      ),
                      Icon(
                        Icons.arrow_outward_rounded,
                        size: context.textTheme.labelMedium!.fontSize,
                        color: context.textTheme.labelMedium!.color,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          LabeledColumn(
            title: "based in",
            child: InkWell(
              onTap: () {},
              child: txt(
                "Iran · Available in tabriz",
                style: context.textTheme.bodyLarge,
              ),
            ),
          ),

          SizedBox(),
        ],
      ),
    );
  }
}
