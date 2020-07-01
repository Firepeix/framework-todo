import 'pages/index.dart';
import 'package:flutter/material.dart';

class Router {
  Map<String, WidgetBuilder> getRoutes () {
    return {
      '/albums': (context) => AlbumsPage()
    };
  }
}