import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/colors.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/app_bar_actions.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/profile_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //* app bar of page
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.flutter_dash_rounded),
        actions: [AppBarActions()],
      ),

      //* body of page
      body: SizedBox.expand(
        child: Column(
          children: [
            //* profile image
            ProfileImage(),
          ],
        ),
      ),
    );
  }
}
