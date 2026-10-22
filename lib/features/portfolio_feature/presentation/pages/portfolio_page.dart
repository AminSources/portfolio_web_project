import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/keys/navigation_keys.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/about_section.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/contact_section/contact_section.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section/hero_section.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/works_section.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/drawer_body.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/footer_section.dart';

class PortfolioPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO remove latter
    debugPrint("width: ${MediaQuery.sizeOf(context).width}");
    debugPrint("height: ${MediaQuery.sizeOf(context).height}");

    return Scaffold(
      drawer: DrawerBody(),
      drawerScrimColor: Colors.transparent,

      body: SizedBox.expand(
        child: Column(
          children: [
            //* app bar
            CustomAppBar(),

            //* app sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    HeroSection(key: NavigationKeys.heroSectionKey),
                    AboutSection(key: NavigationKeys.aboutSectionKey),
                    WorksSection(key: NavigationKeys.workSectionKey),
                    ContactSection(key: NavigationKeys.contactSectionKey),
                    FooterSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
