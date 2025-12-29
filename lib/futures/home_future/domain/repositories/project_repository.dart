import 'package:personal_page/core/params/no_param.dart';
import 'package:personal_page/core/resource/data_state.dart';
import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';

abstract class ProjectRepository {
  //? fetch projects
  Future<DataState<List<ProjectEntity>>> fetchProjects(NoParam noParam);
}
