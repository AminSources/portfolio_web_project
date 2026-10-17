import 'package:flutter/material.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/hero_section.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/custom_app_bar.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/footer.dart';

class PortfolioPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          children: [
            //* app bar
            CustomAppBar(),

            //* app sections
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [HeroSection()]),
              ),
            ),

            //* footer
            Footer(),
          ],
        ),
      ),
    );
  }
}
