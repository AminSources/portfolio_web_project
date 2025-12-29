import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';

class ProjectModel extends ProjectEntity {
  const ProjectModel({
    super.id,
    super.projectLink,
    super.projectName,
    super.projectPicture,
    super.usedTechnologies,
    super.projectDescription,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> map) {
    return ProjectModel(
      id: map['id'] as int?,
      projectLink: map['projectLink'] as String?,
      projectName: map['projectName'] as String?,
      projectPicture: map['projectPicture'] as String?,
      usedTechnologies: (map['usedTechnologies'] as List?)
          ?.map((dynamic e) => e as String)
          .toList(),
      projectDescription: map['projectDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'projectLink': projectLink,
    'projectName': projectName,
    'projectPicture': projectPicture,
    'usedTechnologies': usedTechnologies,
    'projectDescription': projectDescription,
  };
}
