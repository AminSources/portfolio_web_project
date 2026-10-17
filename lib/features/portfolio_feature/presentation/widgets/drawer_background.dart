import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class DrawerBackground extends StatelessWidget {
  final Widget child;

  const new({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Align(
        alignment: .topCenter,
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              width: double.infinity,
              height: 180,
              color: context.theme.scaffoldBackgroundColor.withValues(
                alpha: 0.3,
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
