import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/colors.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/app_bar_actions.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/location_status_widget.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/name_des_widget.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/profile_image.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/social_media_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar of page
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: txt(
          "<MAF />",
          color: context.textTheme.bodyLarge!.color,
          fontWeight: FontWeight.bold,
          fontFamily: "",
          size: 24.sp,
        ),
        actions: [AppBarActions()],
      ),

      //* body of page
      body: SizedBox.expand(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //* profile image
              Center(child: ProfileImage()),

              //* name and description
              NameDesWidget(),

              //* location and availability
              LocationStatusWidget(),

              //* social media
              SocialMediaWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
