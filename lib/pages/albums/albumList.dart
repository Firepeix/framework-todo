import 'package:flutter/material.dart';
import 'package:teste_framework/app/models/album.dart';
import 'package:teste_framework/pages/albums/albumView.dart';
import 'package:teste_framework/repositories/albumRepository.dart';

class AlbumList extends StatefulWidget {
  AlbumList({Key key}) : super(key: key);

  @override
  _AlbumListState createState() => _AlbumListState();
}

class _AlbumListState extends State<AlbumList> {
  final AlbumRepository _albumRepository = AlbumRepository();

  List<Album> _albums;

  @override
  void initState() {
    super.initState();
    getAlbums().then((albums) {
      setState(() {
        _albums = albums;
      });
    });
  }

  Future<List<Album>> getAlbums() async {
    return await _albumRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    if (_albums != null) {
      return GridView.count(
          crossAxisCount: 1,
          childAspectRatio: (6 / 2),
          children: _albums.map((album) {
            return Container(
              padding: EdgeInsets.all(5),
                child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 2,
                    child: AlbumView(
                        id: album.getId(),
                        userId: album.getUserId(),
                        title: album.getTitle()
                    )
                )
            );
          }).toList()
      );
    }

    return Container();
  }
}
