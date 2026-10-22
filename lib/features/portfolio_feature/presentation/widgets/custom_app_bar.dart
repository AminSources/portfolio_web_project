import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/logo.dart';

class CustomAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        final isMobile = constraints.maxWidth < AppBreakpoints.mobile;
        final isDesktop = constraints.maxWidth >= AppBreakpoints.tablet;

        return SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Padding(
                padding: isMobile
                    ? EdgeInsetsGeometry.symmetric(
                        vertical: 20,
                        horizontal: 10.w,
                      )
                    : EdgeInsetsGeometry.symmetric(
                        vertical: 20,
                        horizontal: 20.w,
                      ),
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    //* app logo
                    Logo(),

                    if (isMobile) ...[
                      //* menu icon button
                      InkWell(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(Icons.menu_rounded),
                      ),
                    ] else ...[
                      Row(
                        children: List.generate(
                          4,
                          (index) => TextButton(
                            onPressed: () {},
                            child: txt(
                              ["Home", "About", "Works", "Contact"][index],
                              style: context.textTheme.labelLarge,
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],

                    if (isDesktop) ...[
                      Row(
                        spacing: 10,
                        children: [
                          Icon(Icons.circle, size: 10),
                          txt(
                            "Available for work",
                            style: context.textTheme.labelLarge,
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),

              //* divider
              Container(
                width: double.infinity,
                height: 1,
                color: context.theme.dividerColor,
              ),
            ],
          ),
        );
      }),
    );
  }
}
