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
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                color: Theme.of(context).primaryColor,
              ),
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      height: 30,
                      alignment: Alignment.centerLeft,
                      child: Text('#$id', maxLines: 1, style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold, fontSize: 18),  overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                  Container(
                    child: Text('User: $userId', style: TextStyle(fontSize: 18,color: Colors.white),),
                  )
                ],
              ),

            ),
            Flexible(
              child: Container(
                alignment: Alignment.center,
                height: 100,
                child: Text(title, maxLines: 3, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), textAlign: TextAlign.center, overflow: TextOverflow.ellipsis,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}