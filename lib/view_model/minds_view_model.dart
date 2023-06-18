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
    notifyListeners();
  }

  readMinds() async {
    loadingChanger();
    minds = await mindRepository!.readMind();
    loadingChanger();
    notifyListeners();
  }

  loadingChanger() {
    isLoading != isLoading;
  }

  void updateMind(MindModel mindModel, String mind) async {
    mindRepository!.updateMind(mindModel, mind);
    readMinds();
  }

  void deleteMind(String mind) async {
    mindRepository!.deleteMind(mind);
    readMinds();
  }
}
