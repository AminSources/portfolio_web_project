import 'package:dio/dio.dart';
import 'package:personal_page/core/constants/urls.dart';
import 'package:personal_page/core/params/no_param.dart';

class ApiProvider {
  //* Dio pkg
  final Dio dio = Dio();

  //? get projects list
  Future<dynamic> getProjects(NoParam noParam) async {
    //* call api
    final Response response = await dio.get(apiUrl);

    //* return data
    return response;
  }
}
