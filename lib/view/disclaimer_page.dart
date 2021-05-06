import 'package:flutter/material.dart';
import 'package:miras/view/answered_forms/has_no_spouse_or_children.dart';
import 'package:miras/view/answered_forms/has_only_children.dart';
import 'package:miras/view/answered_forms/has_only_spouse.dart';
import 'package:miras/view/home_page.dart';
import 'package:miras/view/start_page.dart';

import '../model/constants.dart';

class DisclaimerPage extends StatefulWidget {
  @override
  _DisclaimerPageState createState() => _DisclaimerPageState();
}

class _DisclaimerPageState extends State<DisclaimerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // in order not to use constants like pixels,
        // we decided to use MediaQuery for responsiveness.
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor,
              AppColors.mainColor.withOpacity(.2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/logo.png"),
              ),
            ),
            Positioned(
              bottom: 50,
              child: buildBottom(context),
            ),
          ],
        ),
      ),
    );
  }
}

// Adding bottom container here for readability
Widget buildBottom(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Lorem ipsum bir şey bir şey",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        Text(
          "Açıklamalar bir şey bir şey bir şey uzun uzun açıklama hebele hübele",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => OnlySpouse(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  offset: Offset(1, 1),
                  spreadRadius: 1,
                  blurRadius: 3,
                ),
              ],
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            //bunu direkt pixel olarak versek daha iyi oluyor ama
            //biraz kontrol edelim şimdilik responsiveness için
            height: MediaQuery.of(context).size.height * 0.05,
            child: Center(
                child: Text("BAŞLA",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ))),
          ),
        ),
      ],
    ),
  );
}
