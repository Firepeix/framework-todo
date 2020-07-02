import 'package:flutter/material.dart';
import 'package:teste_framework/pages/appPage.dart';
import 'package:teste_framework/pages/posts/postList.dart';


class PostPage extends AppPage {
  final String title = 'Posts';
  final IconData icon = Icons.message;

  @override
  String getTitle() => title;

  @override
  IconData getIcon() => icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PostList()
    );
  }
}