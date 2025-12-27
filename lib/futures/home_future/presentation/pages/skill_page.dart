import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/lists.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/skill_widget.dart';

class SkillPage extends StatelessWidget {
  const SkillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: SizedBox(
        width: double.infinity,
        height: 725.h,
        child: Column(
          children: [
            // space
            SizedBox(height: 50.r),

            //* page name chip
            Chip(
              label: txt("Skills", color: context.textTheme.bodyLarge!.color),
            ),

            // space
            SizedBox(height: 20.r),

            //* title
            txt(
              "The skills, tools and technologies I am really good at:",
              color: context.textTheme.bodyMedium!.color,
              size: 18.sp,
              textAlign: TextAlign.center,
            ),

            // space
            SizedBox(height: 20.r),

            //* skill list
            Wrap(
              spacing: 20.r,
              runSpacing: 40.r,
              children: List.generate(
                7,
                (index) => SkillWidget(
                  skillName: skillsName[index],
                  iconPath: skillIconPath[index],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
