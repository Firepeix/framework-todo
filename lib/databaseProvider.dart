import 'dart:async';
import 'package:teste_framework/database/migrations.dart';
import 'package:teste_framework/repositories/abstractRepository.dart';

import 'app/models/model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  final Migration _migration = Migration();
  static Database _database;
  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();
  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    return await openDatabase(
        join(await getDatabasesPath(), "test_frameworks.db"),
        version: 1,
        onCreate: (Database db, int version) async {
          _migration.getCommands('v1').forEach((command) async {
            await db.execute(command);
          });
    });


  }

  Future<int> create(AbstractRepository repository, Model model) async {
    final database = await this.database;
    return await database.insert(repository.getTable(), model.toMap());
  }

  Future<int> update(AbstractRepository repository, Model model) async {
    final database = await this.database;
    var result = await database.update(repository.getTable(), model.toMap(),
        where: "id = ?", whereArgs: [model.getId()]);
    return result;
  }

  Future<List> getAll(AbstractRepository repository) async {
    final database = await this.database;
    return await database.query(repository.getTable());
  }

  Future<List> whereIn(AbstractRepository repository, String where, List list) async {
    final database = await this.database;
    return await database.query(repository.getTable(), where: '$where in (${List.filled(list.length, '?').join(',')})', whereArgs: list);
  }
}