import 'package:teste_framework/databaseProvider.dart';
import 'package:teste_framework/app/models/model.dart';
abstract class AbstractRepository<TModel> {
  String getTable();
  Future<List> getAll() async {
    var result = await DatabaseProvider.db.getAll(this);
    return result;
  }
  Future<List> getWhereIn(String where, List list) async {
    var result = await DatabaseProvider.db.whereIn(this, where, list);
    return result;
  }

  Future<int> save (Model model) async {
    if(model.modelExists()) {
      return await DatabaseProvider.db.update(this, model);
    }
    return await DatabaseProvider.db.create(this, model);
  }
}