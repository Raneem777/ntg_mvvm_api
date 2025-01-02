import 'package:flutter/material.dart';
import 'package:ntg_mvvm_api/reposetory/Model/data.dart';
import 'package:ntg_mvvm_api/reposetory/repo.dart';

class ViewModel extends ChangeNotifier {
  final posts = Repo();
  bool isloading = true;
  var postList = <ModelData>[];

  bool isLoading() {
    return isloading;
  }

  void posts2(var posts2) {
    postList = posts2;
    notifyListeners();
  }

  void load(var load) {
    isloading = load;
    notifyListeners();
  }

  Future<void> fetchPost() async {
    try {
      postList = (await posts.fetchUser()) ?? [];
      load(false);
      posts2(postList);
    } catch (e) {
      load(false);
      rethrow;
    }
  }
}
