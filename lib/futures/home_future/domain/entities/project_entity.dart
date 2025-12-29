import 'package:equatable/equatable.dart';

class ProjectEntity extends Equatable {
  final int? id;
  final String? projectLink;
  final String? projectName;
  final String? projectPicture;
  final List<String>? usedTechnologies;
  final String? projectDescription;

  const ProjectEntity({
    this.id,
    this.projectLink,
    this.projectName,
    this.projectPicture,
    this.usedTechnologies,
    this.projectDescription,
  });

  @override
  List<Object?> get props => [
    id,
    projectLink,
    projectName,
    projectPicture,
    usedTechnologies,
    projectDescription,
  ];
}
