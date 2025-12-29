import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/project_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    // page controller
    final PageController controller = PageController();

    // projects count
    final int count = 5;

    // page
    return Container(
      width: double.infinity,
      height: 860.h,
      color: context.colorScheme.surface,
      child: Column(
        children: [
          // space
          SizedBox(height: 50.r),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.r),
            child: Column(
              children: [
                //* page name chip
                Chip(
                  label: txt("Work", color: context.textTheme.bodyLarge!.color),
                ),

                // space
                SizedBox(height: 20.r),

                //* title
                txt(
                  "Notable projects built by me:",
                  color: context.textTheme.bodyMedium!.color,
                  size: 18.sp,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // space
          SizedBox(height: 20.r),

          //* page indicator
          SmoothPageIndicator(
            controller: controller,
            count: count,
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 8,
              activeDotColor: context.colorScheme.primary,
              dotColor: context.theme.chipTheme.backgroundColor,
            ),
          ),

          // space
          SizedBox(height: 10.r),

          //* projects list view
          SizedBox(
            width: double.infinity,
            height: 660.h,
            child: PageView.builder(
              controller: controller,
              itemCount: count,
              itemBuilder: (context, index) {
                return ProjectWidget(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
