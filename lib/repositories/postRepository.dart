import 'package:teste_framework/app/models/post.dart';
import 'package:teste_framework/repositories/abstractRepository.dart';

class PostRepository extends AbstractRepository<Post> {
  @override
  String getTable() {
    return 'posts';
  }

  @override
  Future<List<Post>> getAll() async {
    var result = await super.getAll();
    return result.map((model) => Post.fromMap(model, exists: true)).toList();
  }

  Future<List<Post>> getWhereIn(String where, List list) async {
    var result = await super.getWhereIn(where, list);
    return result.map((model) => Post.fromMap(model, exists: true)).toList();
  }

  static Map<String, List<String>> getMigrations() {
    return {'v1': getV1Migrations()};
  }

  static List<String> getV1Migrations () {
    return ["CREATE TABLE posts ("
        "id INTEGER PRIMARY KEY,"
        "userId INTEGER NOT NULL,"
        "title VARCHAR(200),"
        "body TEXT"
        ")"];
  }
}