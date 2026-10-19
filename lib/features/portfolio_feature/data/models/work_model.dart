import 'package:portfolio_web_project/features/portfolio_feature/domain/entities/work_entity.dart';

class WorkModel extends WorkEntity {
  const new({
    required super.shortName,
    required super.usedTechnologies,
    required super.year,
    required super.title,
    required super.description,
    required super.titleImagePath,
    required super.projectUrl,
  });

  factory WorkModel.fromJson(Map<String, dynamic> json) {
    return WorkModel(
      shortName: json["short_name"],
      usedTechnologies: json["used_technologies"],
      year: json["year"],
      title: json["title"],
      description: json["description"],
      titleImagePath: json["title_image_path"],
      projectUrl: json["project_url"],
    );
  }
}
