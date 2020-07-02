import 'package:teste_framework/pages/appPage.dart';

import 'pages/index.dart';
import 'package:flutter/material.dart';

class Router {
  static List<AppPage> get pages => [
    HomePage(),
    AlbumsPage(),
    PostPage(),
    TodoPage()
  ];

  List<BottomNavigationBarItem> getNavItems () {
    List<BottomNavigationBarItem> items = new List();
    pages.forEach((page) {
      items.add(BottomNavigationBarItem(
          title: Text(page.getTitle()),
          icon: Icon(page.getIcon())
      ));
    });

    return items;
  }
  Map<String, WidgetBuilder> getRoutes () {
    return {
      '/albums': (context) => AlbumsPage(),
      '/posts': (context) => PostPage(),
      '/todos': (context) => TodoPage(),
    };
  }
}