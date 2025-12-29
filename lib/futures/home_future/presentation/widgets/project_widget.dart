import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/constants/urls.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectEntity projectEntity;
  const ProjectWidget({super.key, required this.projectEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.r),
      decoration: BoxDecoration(
        color: context.theme.cardTheme.color,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* picture of project
          Container(
            width: double.infinity,
            height: 200.h,
            decoration: BoxDecoration(
              color: context.theme.chipTheme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Container(
              margin: EdgeInsets.all(25.r),
              decoration: BoxDecoration(
                color: context.colorScheme.surface,
                borderRadius: BorderRadius.circular(10.r),
                image: DecorationImage(
                  image: NetworkImage(
                    "$corsLink${projectEntity.projectPicture}",
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),

          //* project details
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 410.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //* project name
                  txt(
                    projectEntity.projectName ?? "Project Name",
                    color: context.textTheme.bodyLarge!.color,
                    fontWeight: FontWeight.bold,
                    size: 20.sp,
                  ),

                  //* project description
                  txt(
                    projectEntity.projectDescription ?? "non-description",
                    color: context.textTheme.bodyMedium!.color,
                    size: 16.sp,
                    textAlign: TextAlign.justify,
                  ),

                  //* technologies used
                  Wrap(
                    spacing: 10.r,
                    runSpacing: 10.r,
                    children: List.generate(
                      projectEntity.usedTechnologies!.length,
                      (techIndex) => Chip(
                        label: txt(
                          projectEntity.usedTechnologies![techIndex],
                          color: context.textTheme.bodyLarge!.color,
                          size: 14.sp,
                        ),
                      ),
                    ),
                  ),

                  //* view project button
                  IconButton(
                    onPressed: () {
                      //? open github page
                      launchUrl(Uri.parse(projectEntity.projectLink!));
                    },
                    icon: Icon(FeatherIcons.github),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
