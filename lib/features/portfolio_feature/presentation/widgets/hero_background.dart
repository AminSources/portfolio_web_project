import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';

class HeroBackground extends StatelessWidget {
  final Widget child;

  const new({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.85,
      child: Stack(
        fit: StackFit.expand,
        children: [
          //* background image
          Positioned.fill(
            child: Image.asset(
              "lib/assets/images/black-hole.jpg",
              fit: BoxFit.cover,
              alignment: Alignment.center,
            ),
          ),

          //* background cover
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.theme.scaffoldBackgroundColor.withValues(
                  alpha: 0.8,
                ),
              ),
            ),
          ),

          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: .topCenter,
                  end: .bottomCenter,
                  colors: [
                    context.theme.scaffoldBackgroundColor,
                    context.theme.scaffoldBackgroundColor.withValues(
                      alpha: 0.6,
                    ),
                    context.theme.scaffoldBackgroundColor.withValues(
                      alpha: 0.3,
                    ),
                    context.theme.scaffoldBackgroundColor.withValues(
                      alpha: 0.1,
                    ),
                    Colors.transparent,
                    Colors.transparent,
                    context.theme.scaffoldBackgroundColor.withValues(
                      alpha: 0.3,
                    ),
                    context.theme.scaffoldBackgroundColor,
                  ],
                ),
              ),
            ),
          ),

          //* child
          child,
        ],
      ),
    );
  }
}
