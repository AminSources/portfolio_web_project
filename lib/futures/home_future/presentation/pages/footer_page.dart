import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.h,
      color: context.colorScheme.surface,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: Center(
        child: txt(
          "© 2025 | Developed by M. Amin Farshbaf.",
          color: context.textTheme.bodyLarge!.color,
        ),
      ),
    );
  }
}
