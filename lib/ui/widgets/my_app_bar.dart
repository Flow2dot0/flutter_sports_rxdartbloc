import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String label;

  MyAppBar({@required this.label})
      : super(title: Text(label), centerTitle: true);
}
