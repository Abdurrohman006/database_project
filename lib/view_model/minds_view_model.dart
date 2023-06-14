import 'package:database_project/data/model/mind_model.dart';
import 'package:database_project/repository/mind_repository.dart';
import 'package:flutter/cupertino.dart';

class MindsViewModel extends ChangeNotifier {
  MindRepository? mindRepository;
  MindsViewModel({required this.mindRepository});

  List<MindModel>? minds;
  bool isLoading = false;

  void addMind(MindModel mind) async {
    mindRepository!.addMind(mind);
  }

  readMinds() async {
    loadingChanger();
    minds = await mindRepository!.readMind();
    loadingChanger();
  }

  loadingChanger() {
    isLoading != isLoading;
  }
}
