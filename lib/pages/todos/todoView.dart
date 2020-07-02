import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_framework/app/models/album.dart';

class TodoView extends StatelessWidget{
  final int id;
  final int userId;
  final String title;
  final bool completed;

  const TodoView({Key key, this.id, this.userId, this.title, this.completed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text('$id - ', style: TextStyle(fontSize: 18),),
              ),
              Flexible(
                child: Container(
                  alignment: Alignment.centerLeft,
                  height: 100,
                  child: Text(title, maxLines: 1, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18), overflow: TextOverflow.ellipsis,),
                ),
              ),
              Container(
                child: Checkbox(value: completed, onChanged: (state) { }),
              )
            ],
          ),
        ),
      )
    );
  }
}