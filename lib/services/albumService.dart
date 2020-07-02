import 'package:teste_framework/app/models/album.dart';
import 'package:teste_framework/repositories/albumRepository.dart';
import 'package:teste_framework/services/abstractService.dart';

class AlbumService extends AbstractService {
  final AlbumRepository _albumRepository = AlbumRepository();

  AlbumService () {
    uri = baseUri + '/albums';
  }

  @override
  bool shouldSync() {
    return true;
  }

  @override
  Future<void> sync() async {
    var albums = await getAlbums();
    var existentAlbums = await _albumRepository.getWhereIn('id', albums.map((album) => album.getId()).toList());
    albums.forEach((album) {
      if(existentAlbums.isNotEmpty) {
        var existentAlbum = existentAlbums.firstWhere((existentAlbum) => existentAlbum.getId() == album.getId());
        if(existentAlbum != null) {
          album = existentAlbum.update(album);
        }
      }

      _albumRepository.save(album);
    });
  }

  Future<List<Album>> getAlbums() async {
    var albums = await fetch();
    return albums.map((album) => Album.fromJson(album)).toList();
  }
}