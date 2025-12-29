import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/lists.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/drawer_header.dart';

class DrawerBody extends StatelessWidget {
  final List<GlobalKey> globalKeys;
  const DrawerBody({super.key, required this.globalKeys});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                onPressed: () {
                  //? close drawer
                  Navigator.pop(context);

                  //? scroll to page
                  Scrollable.ensureVisible(
                    globalKeys[index].currentContext!,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
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
              onPressed: () {
                //? show unavilable tast
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: txt("Unavilable right now")));
              },
              child: txt("Download CV"),
            ),
          ),
        ],
      ),
    );
  }
}
