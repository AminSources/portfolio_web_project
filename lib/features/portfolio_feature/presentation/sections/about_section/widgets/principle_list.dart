import 'package:flutter/material.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/about_section/widgets/principle_item.dart';

class PrincipleList extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: ((context, index) => PrincipleItem(
        count: (index + 1).toString().padLeft(2, "0"),
        title: ["Clarity first", "Built to adapt", "Always exploring"][index],
        subtitle: [
          "Less noise, more meaning. Every element earns its place.",
          "Responsive, accessible experiences for real-world screens.",
          "Stay curious, learn continuously, and keep moving forward.",
        ][index],
      )),
    );
  }
}
