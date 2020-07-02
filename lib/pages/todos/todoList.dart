import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teste_framework/app/models/todo.dart';
import 'package:teste_framework/pages/todos/todoView.dart';
import 'package:teste_framework/repositories/repositories.dart';

class TodoList extends StatefulWidget {
  TodoList({Key key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TodoRepository _todoRepository = TodoRepository();

  List<Todo> _todos;

  @override
  void initState() {
    super.initState();
    getTodos().then((todos) {
      setState(() {
        _todos = todos;
      });
    });
  }

  Future<List<Todo>> getTodos() async {
    return await _todoRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    if (_todos != null) {
      return ListView(
          children: _todos.map((todo) {
        return Container(
            padding: EdgeInsets.only(left: 8,right: 8, top: 2, bottom: 2),
            height: 60,
            child: Container(
                  padding: EdgeInsets.all(6),
                  child: TodoView(
                    id: todo.getId(),
                    userId: todo.getUserId(),
                    title: todo.getTitle(),
                    completed: todo.isCompleted(),
                  ),
                ));
      }).toList());
    }

    return Container();
  }
}
