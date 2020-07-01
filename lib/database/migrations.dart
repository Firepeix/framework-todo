import 'package:teste_framework/repositories/albumRepository.dart';
import 'package:teste_framework/repositories/postRepository.dart';
import 'package:teste_framework/repositories/repositories.dart';

class Migration {
  final Map<String, List<String>> commands = Map<String, List<String>>();

  Migration() {
    addMigrationsV1();
  }

  void addMigrationsV1() {
    var migrations = List<String>();
    migrations.addAll(AlbumRepository.getMigrations()['v1']);
    migrations.addAll(PostRepository.getMigrations()['v1']);
    migrations.addAll(TodoRepository.getMigrations()['v1']);
    commands['v1'] = migrations;
  }
  List<String> getCommands(String version) {
    return commands[version];
  }

}