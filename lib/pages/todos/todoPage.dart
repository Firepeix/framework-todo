import 'package:flutter/material.dart';
import 'package:teste_framework/pages/appPage.dart';
import 'package:teste_framework/pages/todos/todoList.dart';


class TodoPage extends AppPage {
  final String title = 'TODOs';
  final IconData icon = Icons.list;

  @override
  String getTitle() => title;

  @override
  IconData getIcon() => icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TodoList()
    );
  }
}