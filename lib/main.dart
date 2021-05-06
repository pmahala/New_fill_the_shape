import 'package:fill_the_shape/SplashScreen.dart';
import 'package:flutter/material.dart';

//What up???? 2
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.white,
        backgroundColor: Colors.white,
      ),
    );
  }
}
