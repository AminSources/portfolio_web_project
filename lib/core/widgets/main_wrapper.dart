import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/lists.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/pages/about_me_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/contact_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/footer_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/home_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/skill_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/work_page.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/app_bar_actions.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/drawer_header.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar of app
      appBar: AppBar(
        actions: [AppBarActions()],
        leadingWidth: 115.w,
        leading: Center(
          child: Padding(
            padding: EdgeInsets.only(left: 15.r),
            child: txt(
              "<MAF />",
              color: context.textTheme.bodyLarge!.color,
              fontWeight: FontWeight.bold,
              fontFamily: "",
              size: 24.sp,
            ),
          ),
        ),
      ),

      //* drawer of app
      endDrawer: Drawer(
        child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* drawer header
              DrawerHeaderWidget(),

              //* divider
              Divider(),

              // space
              SizedBox(height: 20.r),

              //* drawer items
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(drawerItems.length, (index) {
                  return TextButton(
                    onPressed: () {},
                    child: txt(
                      drawerItems[index],
                      color: context.textTheme.bodyMedium!.color,
                      size: 18.sp,
                    ),
                  );
                }),
              ),

              // space
              SizedBox(height: 20.r),

              //* divider
              Divider(),

              // space
              SizedBox(height: 20.r),

              //* switch theme button
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //* txt
                    txt(
                      "Switch Theme",
                      color: context.textTheme.bodyMedium!.color,
                      size: 18.sp,
                    ),

                    //* icon
                    Icon(FeatherIcons.sun),
                  ],
                ),
              ),

              //* download cv button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: txt("Download CV"),
                ),
              ),
            ],
          ),
        ),
      ),

      //* body of app
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* home page
              HomePage(),

              //* about me page
              AboutMePage(),

              //* skills page
              SkillPage(),

              //* work page
              WorkPage(),

              //* contact page
              ContactPage(),

              //* footer page
              FooterPage(),
            ],
          ),
        ),
      ),
    );
  }
}
