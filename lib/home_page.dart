import 'package:flutter/material.dart';

import 'constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: gradientEndColor,
        body: Container(
            child: SafeArea(
                child: Column(
          children: <Widget>[
            Text(
              "Uygulama Hakkında",
              style: TextStyle(
                fontFamily: "Ubuntu",
                fontSize: 44,
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.left,
            ),
            DropdownButton(
              items: [
                DropdownMenuItem(
                  child: Text(
                    "Detaylar",
                    style: TextStyle(
                      fontFamily: "Ubuntu",
                      fontSize: 22,
                      color: const Color(0x7cdbf1ff),
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
              onChanged: (value) {},
              icon: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Icon(Icons.add),
              ),
              underline: SizedBox(),
            ),
          ],
        ))));
  }
}
