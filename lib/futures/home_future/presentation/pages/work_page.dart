import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:personal_page/core/params/no_param.dart';
import 'package:personal_page/core/utils/theme_extension.dart';
import 'package:personal_page/core/widgets/txt.dart';
import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';
import 'package:personal_page/futures/home_future/presentation/bloc/project_bloc.dart';
import 'package:personal_page/futures/home_future/presentation/bloc/project_status.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/project_loading_widget.dart';
import 'package:personal_page/futures/home_future/presentation/widgets/project_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  @override
  void initState() {
    super.initState();

    //* no param
    NoParam noParam = NoParam();

    //? load projects
    BlocProvider.of<ProjectBloc>(
      context,
    ).add(LoadProjectEvent(noParam: noParam));
  }

  @override
  Widget build(BuildContext context) {
    //* page controller
    final PageController controller = PageController();

    // page
    return Container(
      width: double.infinity,
      height: 860.h,
      color: context.colorScheme.surface,
      padding: EdgeInsets.symmetric(horizontal: 15.r),
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

          BlocBuilder<ProjectBloc, ProjectState>(
            builder: (context, state) {
              //? state on loading
              if (state.projectStatus is ProjectLoading) {
                return ProjectLoadingWidget();
              }
              //? state on error
              else if (state.projectStatus is ProjectError) {
                return txt(
                  (state.projectStatus as ProjectError).message,
                  color: context.textTheme.bodyMedium!.color,
                );
              }
              //? state on success
              else if (state.projectStatus is ProjectComplete) {
                //* cast state
                final ProjectComplete projectComplete =
                    state.projectStatus as ProjectComplete;

                //* project entity
                List<ProjectEntity> projectEntities =
                    projectComplete.projectEntities;

                // data
                return Column(
                  children: [
                    //* page indicator
                    SmoothPageIndicator(
                      controller: controller,
                      count: projectEntities.length,
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
                        itemCount: projectEntities.length,
                        itemBuilder: (context, index) {
                          return ProjectWidget(
                            projectEntity: projectEntities[index],
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
