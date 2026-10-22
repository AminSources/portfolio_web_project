import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/principle_item.dart';

class PrincipleTable extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final borderSide = BorderSide(color: context.theme.dividerColor);

    return Row(
      children: List.generate(
        3,
        (index) => Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border(
                top: borderSide,
                left: index == 0 ? BorderSide.none : borderSide,
                right: index == 2 ? BorderSide.none : borderSide,
                bottom: borderSide,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: PrincipleItem(
                count: (index + 1).toString().padLeft(2, "0"),
                title: [
                  "Clarity first",
                  "Built to adapt",
                  "Always exploring",
                ][index],
                subtitle: [
                  "Less noise, more meaning. Every element earns its place.",
                  "Responsive, accessible experiences for real-world screens.",
                  "Stay curious, learn continuously, and keep moving forward.",
                ][index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
