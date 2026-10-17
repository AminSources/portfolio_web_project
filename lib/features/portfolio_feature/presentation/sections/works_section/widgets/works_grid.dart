import 'package:flutter/material.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/work_item.dart';

class WorksGrid extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        3,
        (index) => WorkItem(
          imagePath: "",
          count: (index + 1).toString().padLeft(2, "0"),
          shortName: ["hamsafar", "portfolio web", "development"][index],
          usedTechnologies: [
            "mobile - flutter",
            "web - flutter",
            "mobile - flutter",
          ][index],
          year: 2026,
          title: [
            "Hamsafar-Coordinate travel",
            "Aminsources-Portfolio web",
            "Unknown-A project",
          ][index],
          description: [
            "Hamsafar is a Flutter application designed to simplify planning and coordinating short trips with friends.",
            "Aminsources web is an responsive and clean ui portfolio web",
            "Unknown A project Unknown-A project Unknown-A project Unknown-A project",
          ][index],
          workUrl: "",
        ),
      ),
    );
  }
}
