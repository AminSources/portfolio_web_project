import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/colors.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class LocationStatusWidget extends StatelessWidget {
  const LocationStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* location
        Row(
          children: [
            //* icon
            Icon(FeatherIcons.mapPin),

            // space
            SizedBox(width: 10.r),

            //* location
            txt(
              "Tabriz, Iran",
              color: context.textTheme.bodyMedium!.color,
              size: 18.sp,
            ),
          ],
        ),

        // space
        SizedBox(height: 10.r),

        //* availability
        Row(
          children: [
            //* icon
            Icon(FeatherIcons.clock, color: greenColor),

            // space
            SizedBox(width: 10.r),

            //* txt
            txt(
              "Available for a new project",
              color: context.textTheme.bodyMedium!.color,
              size: 18.sp,
            ),
          ],
        ),
      ],
    );
  }
}
