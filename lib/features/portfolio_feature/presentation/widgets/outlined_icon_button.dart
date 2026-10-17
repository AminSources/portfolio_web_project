import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class OutlinedIconButton extends StatelessWidget {
  final double? size;
  final VoidCallback onTap;
  final IconData icon;

  const new({
    super.key,
    this.size = 40,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Material(
        type: MaterialType.transparency,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border.all(color: context.theme.dividerColor),
          ),
          child: InkWell(
            onTap: onTap,
            child: Icon(icon, color: context.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}
