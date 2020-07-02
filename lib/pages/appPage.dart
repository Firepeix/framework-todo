import 'package:flutter/material.dart';

abstract class AppPage extends StatelessWidget {
  String getTitle();
  IconData getIcon();
}