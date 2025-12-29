part of 'project_bloc.dart';

sealed class ProjectEvent extends Equatable {
  const ProjectEvent();

  @override
  List<Object> get props => [];
}

class LoadProjectEvent extends ProjectEvent {
  final NoParam noParam;

  const LoadProjectEvent({required this.noParam});
}
