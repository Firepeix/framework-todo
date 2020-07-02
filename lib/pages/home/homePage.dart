import 'package:flutter/material.dart';
import 'package:teste_framework/pages/appPage.dart';


class HomePage extends AppPage {
  final String title = 'Home';
  final IconData icon = Icons.home;

  @override
  String getTitle() => title;
  @override
  IconData getIcon() => icon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Text('Ola!', style: TextStyle(fontSize: 100, fontWeight: FontWeight.bold),),
        )
    );
  }
}