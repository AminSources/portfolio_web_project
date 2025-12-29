import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/lists.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/contact_info_widget.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 15.r),
      child: SizedBox(
        width: double.infinity,
        height: 425.h,
        child: Column(
          children: [
            // space
            SizedBox(height: 50.r),

            //* page name chip
            Chip(
              label: txt(
                "Get in touch",
                color: context.textTheme.bodyLarge!.color,
              ),
            ),

            // space
            SizedBox(height: 20.r),

            //* title
            txt(
              "What’s next? Feel free to reach out to me if you're looking for a developer, have a query, or simply want to connect.",
              color: context.textTheme.bodyMedium!.color,
              size: 18.sp,
              textAlign: TextAlign.center,
            ),

            // space
            SizedBox(height: 20.r),

            //* contact details
            Column(
              children: List.generate(
                3,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.r),
                  child: ContactInfoWidget(
                    info: contactInfo[index],
                    icon: contactIcons[index],
                  ),
                ),
              ),
            ),

            // space
            SizedBox(height: 20.r),

            //* github button
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //* icon
                  Icon(FeatherIcons.github),

                  //* txt
                  txt("View Github"),

                  // space
                  SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
