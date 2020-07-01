import 'package:teste_framework/app/models/album.dart';
import 'package:teste_framework/repositories/abstractRepository.dart';

class AlbumRepository extends AbstractRepository<Album> {
  @override
  String getTable() {
    return 'albums';
  }

  @override
  Future<List<Album>> getAll() async {
    var result = await super.getAll();
    return result.map((model) => Album.fromMap(model, exists: true)).toList();
  }

  Future<List<Album>> getWhereIn(String where, List list) async {
    var result = await super.getWhereIn(where, list);
    return result.map((model) => Album.fromMap(model, exists: true)).toList();
  }

  static Map<String, List<String>> getMigrations() {
    return {'v1': getV1Migrations()};
  }

  static List<String> getV1Migrations () {
    return ["CREATE TABLE albums ("
        "id INTEGER PRIMARY KEY,"
        "user_id INTEGER NOT NULL,"
        "title VARCHAR(200)"
        ")"];
  }
}