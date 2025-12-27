import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class IconTextWidget extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final String? text;
  const IconTextWidget({super.key, this.icon, this.iconColor, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //* icon
        Icon(icon, color: iconColor),

        // space
        SizedBox(width: 10.r),

        //* text
        txt(text ?? "text place", color: context.textTheme.bodyMedium!.color),
      ],
    );
  }
}
