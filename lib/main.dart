import 'package:flutter/material.dart';
import 'GamePage.dart';

//What up???? 2
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GamePage(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
      ),
    );
  }
}
