import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

class LabeledColumn extends StatelessWidget {
  final String title;
  final Widget child;

  const new({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        txt(title.toUpperCase(), style: context.textTheme.labelSmall),

        child,
      ],
    );
  }
}
