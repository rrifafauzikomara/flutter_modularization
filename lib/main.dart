import 'package:flutter/material.dart';
import 'package:flutter_modularization/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      home: HomePage(title: 'Movies App'),
    );
  }
}