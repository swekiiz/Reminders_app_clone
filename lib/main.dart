import 'package:flutter/material.dart';
import 'package:my_app/pages/home.dart';
import 'package:my_app/pages/InListPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'myFirstApp',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/inlist': (context) => InListPage(),
      },
    );
  }
}
