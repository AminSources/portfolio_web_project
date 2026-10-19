import 'package:equatable/equatable.dart';

class WorkEntity extends Equatable {
  final String shortName;
  final String usedTechnologies;
  final String year;
  final String title;
  final String description;
  final String titleImagePath;
  final String projectUrl;

  const new({
    required this.shortName,
    required this.usedTechnologies,
    required this.year,
    required this.title,
    required this.description,
    required this.titleImagePath,
    required this.projectUrl,
  });

  @override
  List<Object?> get props => [
    shortName,
    usedTechnologies,
    year,
    title,
    description,
    titleImagePath,
    projectUrl,
  ];
}
