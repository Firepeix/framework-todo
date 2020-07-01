import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '../../app/models/album.dart';


class AlbumsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Albums'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Buscar Dados'),
            onPressed: () {
                //Album.fromJson(json.decode(value.body)).save().then((value) => {
                //  developer.log(value.toString())
                //})
            },
          ),
        )
    );
  }
}