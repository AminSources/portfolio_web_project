import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/profile_image.dart';

class AboutMePage extends StatelessWidget {
  const AboutMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.colorScheme.surface,
      width: double.infinity,
      height: 1300.h,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Column(
        children: [
          // space
          SizedBox(height: 50.r),

          //* page name chip
          Chip(
            label: txt("About Me", color: context.textTheme.bodyLarge!.color),
          ),

          // space
          SizedBox(height: 20.r),

          //* profile image
          ProfileImage(
            width: 230.w,
            height: 270.h,
            midColor: context.colorScheme.surface,
          ),

          //* subtitle
          txt(
            "Curious about me? here you have it:",
            color: context.textTheme.bodyLarge!.color,
            size: 30.sp,
          ),

          // space
          SizedBox(height: 20.r),

          //* description
          txt(
            "I’m a passionate cross-platform developer with 5 years of experience building high-quality applications across mobile, web, and desktop. I care deeply about performance, clean architecture, and creating user experiences that are fast, accessible, and visually consistent across platforms.\n\n"
            "I started my programming journey around five years ago, and since then I’ve continuously grown by taking on new challenges and learning modern tools and frameworks. My focus is on developing scalable and maintainable applications using cross-platform technologies, while keeping the balance between technical excellence and user-centered design.\n\n"
            "I enjoy working on products end to end — from initial ideas and problem-solving to development and refinement. Writing clean, readable, and efficient code is something I take seriously, and I’m always looking for better ways to improve my craft.\n\n"
            "When I’m not coding, I spend time exploring new technologies, following developer communities, and learning from real-world products and startups.\n\n"
            "Some quick facts about me:\n"
            "• Cross-platform developer\n"
            "• 5 years of hands-on programming experience\n"
            "• Strong focus on performance and clean code\n"
            "• Continuous learner and problem solver\n\n"
            "I’m available for freelance work. If you have an idea or a project in mind, feel free to reach out — I’d be happy to talk.",
            color: context.textTheme.bodyMedium!.color,
            size: 14.sp,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
