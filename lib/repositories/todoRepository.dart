import 'package:teste_framework/app/models/todo.dart';
import 'package:teste_framework/repositories/abstractRepository.dart';

class TodoRepository extends AbstractRepository<Todo> {
  @override
  String getTable() {
    return 'todos';
  }

  @override
  Future<List<Todo>> getAll() async {
    var result = await super.getAll();
    return result.map((model) => Todo.fromMap(model, exists: true)).toList();
  }

  Future<List<Todo>> getWhereIn(String where, List list) async {
    var result = await super.getWhereIn(where, list);
    return result.map((model) => Todo.fromMap(model, exists: true)).toList();
  }

  static Map<String, List<String>> getMigrations() {
    return {'v1': getV1Migrations()};
  }

  static List<String> getV1Migrations () {
    return ["CREATE TABLE todos ("
        "id INTEGER PRIMARY KEY,"
        "user_id INTEGER NOT NULL,"
        "title VARCHAR(200),"
        "completed INTEGER"
        ")"];
  }
}