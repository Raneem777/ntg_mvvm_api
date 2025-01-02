import 'package:http/http.dart' as http;
import 'package:ntg_mvvm_api/reposetory/Model/data.dart';

class ApiServeces {
  final String url = "http://jsonplaceholder.typicode.com/posts";

  Future<List<ModelData>?> fetchPost() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return modelDataFromJson(response.body);
      } else {
        print("Error: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Exception occurred: $e");
      return null;
    }
  }
}
