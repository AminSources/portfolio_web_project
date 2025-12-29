import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';

class ProjectLoadingWidget extends StatelessWidget {
  const ProjectLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* txt
        txt(
          "Receving Project Data",
          color: context.textTheme.bodyMedium!.color,
          size: 16.sp,
        ),

        // space
        SizedBox(height: 20.r),

        //* progress indicator
        CircularProgressIndicator(strokeCap: StrokeCap.round),
      ],
    );
  }
}
