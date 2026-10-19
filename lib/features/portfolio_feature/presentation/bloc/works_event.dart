part of 'works_bloc.dart';

sealed class WorksEvent extends Equatable {
  const WorksEvent();

  @override
  List<Object> get props => [];
}

final class LoadWorkEvent extends WorksEvent {}
