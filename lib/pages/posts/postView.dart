import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_framework/app/models/album.dart';

class PostView extends StatelessWidget{
  final int id;
  final int userId;
  final String title;
  final String body;

  const PostView({Key key, this.id, this.userId, this.title, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
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
                      child: Text('$id - $title', maxLines: 1, style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold, fontSize: 18),  overflow: TextOverflow.ellipsis,),
                    ),
                  ),
                  Container(
                    child: Text('User: $userId', style: TextStyle(fontSize: 18,color: Colors.white),),
                  )
                ],
              ),

            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: Text(body,style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}