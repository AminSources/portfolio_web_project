import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/pages/about_me_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/contact_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/footer_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/home_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/skill_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/work_page.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/app_bar_actions.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/drawer_body.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    //* global keys
    final GlobalKey homeGlobalKey = GlobalKey();
    final GlobalKey aboutMeGlobalKey = GlobalKey();
    final GlobalKey skillGlobalKey = GlobalKey();
    final GlobalKey workGlobalKey = GlobalKey();
    final GlobalKey contactGlobalKey = GlobalKey();
    List<GlobalKey> pageKeys = [
      homeGlobalKey,
      aboutMeGlobalKey,
      skillGlobalKey,
      workGlobalKey,
      contactGlobalKey,
    ];

    // main wrapper
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
      endDrawer: Drawer(child: DrawerBody(globalKeys: pageKeys)),

      //* body of app
      body: SizedBox.expand(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //* home page
              HomePage(key: homeGlobalKey),

              //* about me page
              AboutMePage(key: aboutMeGlobalKey),

              //* skills page
              SkillPage(key: skillGlobalKey),

              //* work page
              WorkPage(key: workGlobalKey),

              //* contact page
              ContactPage(key: contactGlobalKey),

              //* footer page
              FooterPage(),
            ],
          ),
        ),
      ),
    );
  }
}
