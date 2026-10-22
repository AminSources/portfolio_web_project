import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/constants/app_urls.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/contact_section/widgets/contact_grid.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/contact_section/widgets/contact_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/section_kicker.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.all(20.w),
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
              SizedBox(
                width: _contactTitle(constraints.maxWidth),
                child: ContactTitle(),
              ),
              SizedBox(height: 20),

              txt(
                "Have a project, an opportunity, or an interesting idea? My inbox is open.",
                style: context.textTheme.bodyMedium,
              ),
              SizedBox(height: 20),

              //* button section
              SizedBox(
                height: 40,
                child: ElevatedButton.icon(
                  onPressed: () {
                    launchUrl(Uri.parse(AppUrls.telegramUrl));
                  },
                  label: txt(
                    "Start a conversation",
                    color: context.colorScheme.onPrimary,
                    style: context.textTheme.labelLarge,
                  ),
                  icon: Icon(Icons.arrow_outward_rounded),
                  iconAlignment: IconAlignment.end,
                ),
              ),
              SizedBox(height: 30),

              Divider(),

              //* contact section
              ContactGrid(),
              SizedBox(height: 30),

              Divider(),
            ],
          ),
        );
      },
    );
  }
}

double _contactTitle(double width) {
  if (width < AppBreakpoints.mobile) {
    return 250.w;
  }
  if (width < AppBreakpoints.tablet && width >= AppBreakpoints.mobile) {
    return 200.w;
  }
  if (width >= AppBreakpoints.tablet) {
    return 150.w;
  }
  return 250.w;
}
