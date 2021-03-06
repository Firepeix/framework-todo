import 'package:flutter/material.dart';
import 'package:teste_framework/pages/albums/albumList.dart';
import 'package:teste_framework/pages/appPage.dart';


class AlbumsPage extends AppPage {
  final String title = 'Albuns';
  final IconData icon = Icons.album;


  @override
  String getTitle() => title;

  @override
  IconData getIcon() => icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AlbumList()
    );
  }
}