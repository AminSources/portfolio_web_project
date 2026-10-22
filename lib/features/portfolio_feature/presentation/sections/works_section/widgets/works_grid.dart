import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_web_project/core/widgets/txt.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/bloc/works_bloc.dart';
import 'package:portfolio_web_project/features/portfolio_feature/presentation/sections/works_section/widgets/work_item.dart';

class WorksGrid extends StatefulWidget {
  final double workItemWidth;

  const new({super.key, required this.workItemWidth});

  @override
  State<WorksGrid> createState() => _WorksGridState();
}

class _WorksGridState extends State<WorksGrid> {
  @override
  void initState() {
    super.initState();

    context.read<WorksBloc>().add(LoadWorkEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorksBloc, WorksState>(
      builder: (context, state) {
        //? on idle state
        if (state is WorksInitial) {
          return SizedBox.expand();
        }

        //? on loading state
        if (state is WorksLoading) {
          return CircularProgressIndicator();
        }

        //? on failure state
        if (state is WorksFailure) {
          return Center(child: txt(state.message));
        }

        //? on success state
        if (state is WorksSuccess) {
          final works = state.works;

          return SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: .spaceBetween,
              runSpacing: 20,
              children: List.generate(
                works.length,
                (index) => WorkItem(
                  imagePath: works[index].titleImagePath,
                  count: (index + 1).toString().padLeft(2, "0"),
                  shortName: works[index].shortName,
                  usedTechnologies: works[index].usedTechnologies,
                  year: works[index].year,
                  title: works[index].title,
                  description: works[index].description,
                  workUrl: works[index].projectUrl,
                  width: widget.workItemWidth,
                ),
              ),
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
