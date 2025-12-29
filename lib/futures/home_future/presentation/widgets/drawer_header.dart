import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //* header icon
        txt(
          "<MAF />",
          color: context.textTheme.bodyLarge!.color,
          fontWeight: FontWeight.bold,
          fontFamily: "",
          size: 24.sp,
        ),

        //* close button
        IconButton(
          onPressed: () {
            //? close drawer
            Scaffold.of(context).closeEndDrawer();
          },
          icon: Icon(Icons.close_rounded),
        ),
      ],
    );
  }
}
