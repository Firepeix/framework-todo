import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_framework/app/models/album.dart';

class AlbumView extends StatelessWidget{
  final int id;
  final int userId;
  final String title;

  const AlbumView({Key key, this.id, this.userId, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  child: Text(title, maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
                ),
              ),
              Divider(color: Colors.grey, thickness: 0.2),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text('#$id', style: TextStyle(fontSize: 18),),
                    ),
                    Container(
                      padding: EdgeInsets.zero,
                      height: 30,
                      child: VerticalDivider(width: 0.2, color: Colors.black, thickness: 0.2),
                    ),
                    Container(
                      child: Text('User: $userId', style: TextStyle(fontSize: 20),),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}