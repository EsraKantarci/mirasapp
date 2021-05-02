
import 'package:flutter/material.dart';
import 'pages/home_page.dart';

// For readability purposes, home_page.dart is in another file.

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miras App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      fontFamily: "Ubuntu",
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}