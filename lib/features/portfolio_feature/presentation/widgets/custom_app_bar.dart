import 'package:flutter/material.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/logo.dart';

class CustomAppBar extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                //* app logo
                Logo(),

                //* menu icon button
                InkWell(onTap: () {}, child: Icon(Icons.menu_rounded)),
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
  }
}
