import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class ProjectWidget extends StatelessWidget {
  final int index;
  const ProjectWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.r),
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* picture of project
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              color: context.theme.chipTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(25.r),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          //* project details
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 410.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* project name
                  txt(
                    "Project Name ${index + 1}",
                    color: context.textTheme.bodyLarge!.color,
                    fontWeight: FontWeight.bold,
                    size: 20.sp,
                  ),

                  //* project description
                  txt(
                    "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                    color: context.textTheme.bodyMedium!.color,
                    size: 16.sp,
                    textAlign: TextAlign.justify,
                  ),

                  //* technologies used
                  Wrap(
                    spacing: 10.r,
                    runSpacing: 10.r,
                    children: List.generate(
                      5,
                      (techIndex) => Chip(
                        label: txt(
                          "Tech ${techIndex + 1}",
                          color: context.textTheme.bodyLarge!.color,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ),

                  //* view project button
                  IconButton(onPressed: () {}, icon: Icon(FeatherIcons.github)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
