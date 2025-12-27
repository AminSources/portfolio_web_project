import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/pages/about_me_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/home_page.dart';
import 'package:personal_page/futures/home_future/presentation/pages/skill_page.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/app_bar_actions.dart';

class MainWrapper extends StatelessWidget {
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar of app
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
            ],
          ),
        ),
      ),
    );
  }
}
