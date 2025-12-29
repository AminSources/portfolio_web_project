import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/urls.dart';
import 'package:personal_page/core/utils/theme_extension.dart';

class ProfileImage extends StatelessWidget {
  final double height;
  final double width;
  final Color midColor;
  const ProfileImage({
    required this.height,
    required this.width,
    required this.midColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          //* down container
          Container(
            width: width,
            height: height - 45.h,
            color: context.theme.chipTheme.backgroundColor,
          ),

          //* middle container
          Padding(
            padding: EdgeInsets.only(bottom: 30.0.r),
            child: Container(
              width: width - 15.w,
              height: height - 30.h,
              color: midColor,
            ),
          ),

          //* profile image container
          Padding(
            padding: EdgeInsets.only(bottom: 40.0.r),
            child: Container(
              width: width - 35.w,
              height: height - 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage('$corsLink${githubSourceLink}amin.png'),
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
