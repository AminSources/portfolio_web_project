part of 'project_bloc.dart';

class ProjectState {
  final ProjectStatus projectStatus;

  ProjectState({required this.projectStatus});

  ProjectState copyWith({ProjectStatus? newProjectStatus}) {
    return ProjectState(projectStatus: newProjectStatus ?? projectStatus);
  }
}
