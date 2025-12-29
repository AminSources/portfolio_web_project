import 'package:dio/dio.dart';
import 'package:personal_page/core/params/no_param.dart';
import 'package:personal_page/core/resource/data_state.dart';
import 'package:personal_page/futures/home_future/data/data_source/remote/api_provider.dart';
import 'package:personal_page/futures/home_future/data/models/project_model.dart';
import 'package:personal_page/futures/home_future/domain/entities/project_entity.dart';
import 'package:personal_page/futures/home_future/domain/repositories/project_repository.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  ApiProvider apiProvider = ApiProvider();

  ProjectRepositoryImpl(this.apiProvider);

  @override
  Future<DataState<List<ProjectEntity>>> fetchProjects(NoParam noParam) async {
    //? try catch
    try {
      //? get projects data
      Response response = await apiProvider.getProjects(noParam);

      //* status code condition
      if (response.statusCode == 200) {
        //* convert data
        //ProjectEntity projectEntity = ProjectModel.fromJson(response.data);
        List<ProjectEntity> projectEntities = [];
        for (var item in response.data) {
          projectEntities.add(ProjectModel.fromJson(item));
        }

        //* return data
        return DataSuccess(projectEntities);
      } else {
        //* return error
        return DataError(
          "Something went wrong! - Error on status code - Error: ${response.statusMessage}",
        );
      }
    } catch (e) {
      //? return error
      return DataError("Something went wrong! - Exception: $e");
    }
  }
}
