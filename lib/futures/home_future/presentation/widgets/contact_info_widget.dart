import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class ContactInfoWidget extends StatelessWidget {
  final String? info;
  final IconData? icon;
  const ContactInfoWidget({super.key, this.info, this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon ?? Icons.phone, color: context.colorScheme.primary),
        SizedBox(width: 10.r),
        txt(
          info ?? "info",
          color: context.textTheme.bodyMedium!.color,
          size: 18.sp,
        ),
      ],
    );
  }
}
