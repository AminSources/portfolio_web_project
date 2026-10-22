import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_web_project/core/extensions/theme_extension.dart';
import 'package:portfolio_web_project/core/responsive/app_breakpoints.dart';
import 'package:portfolio_web_project/core/theme/app_colors.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/works_grid.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/works_title.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/widgets/section_kicker.dart';
import 'package:portfolio_web_project/locator.dart';

class WorksSection extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: AppColors.voidSoft,
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              //* header section
              SectionKicker(
                pageCount: "03",
                pageName: "selected works",
                pageBio: "A FEW THINGS BROUGHT INTO ORBIT",
              ),
              SizedBox(height: 20),

              //* title section
              WorksTitle(),

              //* works grid
              BlocProvider(
                create: (_) => sl<WorksBloc>(),
                child: WorksGrid(
                  workItemWidth: constraints.maxWidth < AppBreakpoints.mobile
                      ? double.infinity
                      : MediaQuery.sizeOf(context).width * 0.4,
                ),
              ),
              SizedBox(height: 20),

              //* footer section
              txt(
                "✳ MORE PROJECTS ARE ALWAYS IN MOTION.",
                style: context.textTheme.labelSmall,
              ),
              SizedBox(height: 30),
            ],
          ),
        );
      },
    );
  }
}
