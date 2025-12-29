import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/urls.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class SkillWidget extends StatelessWidget {
  final String? iconPath;
  final String? skillName;
  const SkillWidget({super.key, this.iconPath, this.skillName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* icon
        Container(
          width: 90.w,
          height: 90.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "$corsLink$githubSourceLink${iconPath ?? "flutter.png"}",
              ),
            ),
          ),
        ),

        // space
        SizedBox(height: 10.r),

        //* text
        txt(
          skillName ?? "skill name",
          color: context.textTheme.bodyLarge!.color,
          size: 18.sp,
        ),
      ],
    );
  }
}
