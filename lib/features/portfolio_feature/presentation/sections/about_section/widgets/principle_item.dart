import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';

class PrincipleItem extends StatelessWidget {
  final String count;
  final String title;
  final String subtitle;

  const new({
    super.key,
    required this.count,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(height: 10),

        txt(count, style: context.textTheme.labelMedium),
        SizedBox(height: 10),

        txt(title, style: context.textTheme.titleMedium),

        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.5,
          child: txt(subtitle, style: context.textTheme.bodySmall),
        ),
        SizedBox(height: 10),

        Divider(),
      ],
    );
  }
}
