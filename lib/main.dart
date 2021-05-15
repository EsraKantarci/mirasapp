
import 'package:flutter/material.dart';
import 'package:miras/todolist/child_page.dart';
import 'package:miras/view/disclaimer_page.dart';

// For readability purposes, disclaimer_page.dart is in another file.

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

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
      home: DisclaimerPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}