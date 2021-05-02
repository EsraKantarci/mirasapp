
import 'package:flutter/material.dart';
import 'home_page.dart';

// For readability purposes, home_page.dart is in another file.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Ubuntu",
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}