import 'package:flutter/material.dart';
import 'package:flutter_modularization/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
      ),
      home: HomePage(title: 'Home Page'),
    );
  }
}