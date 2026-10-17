import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const new({super.key, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    final style = textStyle ?? context.textTheme.labelLarge;

    return Row(
      spacing: 10,
      children: [
        Container(
          width: 25,
          height: 1,
          color: style!.color ?? context.colorScheme.primary,
        ),

        txt(text, style: style),
      ],
    );
  }
}
