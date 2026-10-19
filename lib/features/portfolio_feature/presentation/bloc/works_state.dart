part of 'works_bloc.dart';

sealed class WorksState extends Equatable {
  const WorksState();

  @override
  List<Object> get props => [];
}

final class WorksInitial extends WorksState {}

final class WorksLoading extends WorksState {}

final class WorksSuccess extends WorksState {
  final List<WorkEntity> works;

  const new(this.works);

  @override
  List<Object> get props => [works];
}

final class WorksFailure extends WorksState {
  final String message;

  const new(this.message);

  @override
  List<Object> get props => [message];
}
