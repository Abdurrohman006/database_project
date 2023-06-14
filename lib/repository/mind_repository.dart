import 'package:database_project/data/model/mind_model.dart';
import 'package:database_project/service/local_db_service.dart';

class MindRepository {
  LocalDatabase? db;

  MindRepository({required this.db});

  void addMind(MindModel mind) async => await db!.addMind(mind);

  Future<List<MindModel>> readMind() async {
    var result = await db!.getMinds();
    return result.map((e) => MindModel.fromJson(e)).toList();
  }
}
