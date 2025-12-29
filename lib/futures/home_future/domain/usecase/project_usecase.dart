import 'package:personal_page/core/params/no_param.dart';
import 'package:personal_page/core/resource/data_state.dart';
import 'package:personal_page/core/usecase/usecase.dart';
import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';
import 'package:personal_page/futures/home_future/domain/repositories/project_repository.dart';

class ProjectUsecase extends Usecase<DataState<List<ProjectEntity>>, NoParam> {
  final ProjectRepository projectRepository;

  ProjectUsecase(this.projectRepository);

  //? get projects usecase
  @override
  Future<DataState<List<ProjectEntity>>> call(NoParam noParam) async {
    return projectRepository.fetchProjects(noParam);
  }
}
