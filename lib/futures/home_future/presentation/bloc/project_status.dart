import 'package:flutter/material.dart';
import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';

@immutable
abstract class ProjectStatus {}

class ProjectComplete extends ProjectStatus {
  final List<ProjectEntity> projectEntities;

  ProjectComplete(this.projectEntities);
}

class ProjectLoading extends ProjectStatus {}

class ProjectError extends ProjectStatus {
  final String message;

  ProjectError(this.message);
}
