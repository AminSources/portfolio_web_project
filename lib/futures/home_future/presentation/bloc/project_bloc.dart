import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:personal_page/core/params/no_param.dart';
import 'package:personal_page/core/resource/data_state.dart';
import 'package:personal_page/futures/home_future/domain/usecase/project_usecase.dart';
import 'package:personal_page/futures/home_future/presentation/bloc/project_status.dart';

part 'project_event.dart';
part 'project_state.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  final ProjectUsecase projectUsecase;
  ProjectBloc(this.projectUsecase)
    : super(ProjectState(projectStatus: ProjectLoading())) {
    on<LoadProjectEvent>(fetchProjects);
  }

  //? fetch projects method
  void fetchProjects(LoadProjectEvent event, emit) async {
    //? set state to loading
    emit(state.copyWith(newProjectStatus: ProjectLoading()));

    //* call project usecase
    DataState dataState = await projectUsecase(NoParam());

    //* check data state
    if (dataState is DataSuccess) {
      //? set state to success
      emit(ProjectState(projectStatus: ProjectComplete(dataState.data)));
    } else if (dataState is DataError) {
      //? set state to error
      emit(ProjectState(projectStatus: ProjectError(dataState.message!)));
    }
  }
}
