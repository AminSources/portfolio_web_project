import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class NameDesWidget extends StatelessWidget {
  const NameDesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* name
        txt(
          "Hi, I'm Amin 👋",
          color: context.textTheme.bodyLarge!.color,
          fontWeight: FontWeight.bold,
          size: 36.sp,
        ),

        //* description
        txt(
          "I'm a cross-platform developer with 5 years of experience crafting high-quality digital experiences. I focus on building fast, accessible, visually appealing, and responsive applications across mobile, web, and desktop. Even after years in development, I still enjoy creating software as if it were my first project.",
          color: context.textTheme.bodyMedium!.color,
          size: 16.sp,
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
