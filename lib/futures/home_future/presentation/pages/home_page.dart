import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/colors.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/icon_text_widget.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/profile_image.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/social_media_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.r),
      child: SizedBox(
        width: double.infinity,
        height: 710.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //* profile image
            Center(
              child: ProfileImage(
                width: 235.w,
                height: 255.h,
                midColor: context.theme.scaffoldBackgroundColor,
              ),
            ),

            //* name and description
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* name
                txt(
                  "Hi, I'm Amin 👋",
                  color: context.textTheme.bodyLarge!.color,
                  fontWeight: FontWeight.bold,
                  size: 30.sp,
                ),

                // space
                SizedBox(height: 10.r),

                //* description
                txt(
                  "I'm a cross-platform developer with 5 years of experience crafting high-quality digital experiences. I focus on building fast, accessible, visually appealing, and responsive applications across mobile, web, and desktop. Even after years in development, I still enjoy creating software as if it were my first project.",
                  color: context.textTheme.bodyMedium!.color,
                  size: 14.sp,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),

            //* location and availability
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //* location
                IconTextWidget(text: "Tabriz, IRAN", icon: FeatherIcons.mapPin),

                // space
                SizedBox(height: 10.r),

                //* availability
                IconTextWidget(
                  text: "Available for new project",
                  icon: FeatherIcons.check,
                  iconColor: greenColor,
                ),
              ],
            ),

            //* social media
            SocialMediaWidget(),
          ],
        ),
      ),
    );
  }
}
