import 'package:ntg_mvvm_api/reposetory/Model/data.dart';
import 'package:ntg_mvvm_api/apis/ApiServices.dart';

class Repo {
  late  ApiServeces serv = ApiServeces();

  Future<List<ModelData>?> fetchUser() async {
    final response = await serv.fetchPost();
    if (response != null) {
      return response;
    }
    return response;
  }
}
