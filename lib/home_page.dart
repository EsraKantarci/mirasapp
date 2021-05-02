import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black38,
        body: Container(
            child: SafeArea(
                child: Column(
          children: <Widget>[
            Text(
              "Uygulama Hakkında",
              style: TextStyle(
                fontFamily: "Avenir",
                fontSize: 44,
                color: Colors.blue,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ))));
  }
}
