import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/colors.dart';
import 'package:personal_page/core/utils/theme_extension.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155.w,
      height: 190.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //* down container
          Container(
            width: 155.w,
            height: 145.h,
            color: context.theme.chipTheme.backgroundColor,
          ),

          //* middle container
          Padding(
            padding: EdgeInsets.only(bottom: 30.0.r),
            child: Container(
              width: 140.w,
              height: 160.h,
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),

          //* profile image container
          Padding(
            padding: EdgeInsets.only(bottom: 30.0.r),
            child: Container(
              width: 130.w,
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/images/amin.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
