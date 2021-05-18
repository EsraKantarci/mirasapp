import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

import 'forms/form_page.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  //in second sprint we will get them inside the Answer list.
  int tester1 = -1;
  int tester2 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: buildQuestion("Miras bırakanın ismi:"),
            ),
            buildSpace(),
            buildTextInput(context),
            buildSpace(),
            buildQuestion("Miras bırakan öldüğünde evli miydi?"),
            buildRadioButton1("Evet", 1, tester1),
            buildRadioButton1("Hayır", 0, tester1),
            buildSpace(),
            buildQuestion(
                "Miras bırakanın altsoyu (çocukları, torunları vb.) bulunuyor muydu?"),
            buildRadioButton2("Evet", 1, tester2),
            buildRadioButton2("Hayır", 0, tester2),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: buildElevatedButton(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildRadioButton1(String text, int val, int group) {
    return Container(
      width: 150,
      child: Row(
        children: <Widget>[
          Radio(
              value: val,
              groupValue: group,
              onChanged: (value) {
                tester1 = value;
                setState(() {});
              }),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Container buildRadioButton2(String text, int val, int group) {
    return Container(
      width: 150,
      child: Row(
        children: <Widget>[
          Radio(
              value: val,
              groupValue: group,
              onChanged: (value) {
                tester2 = value;
                setState(() {});
              }),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  SizedBox buildSpace() => SizedBox(
        height: 10,
      );

  Container buildTextInput(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {},
        decoration: InputDecoration(
          hintText: "Miras bırakanın ismini giriniz...",
          hintStyle: TextStyle(fontWeight: FontWeight.normal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Text buildQuestion(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.mainColor,
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Miras Payı Hesaplayıcı"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            //Step: 1
            Icons.looks_one,
            color: Colors.white,
          ),
          onPressed: () {
            //maybe toasting "Adım: 1'desiniz" is a good idea.
          },
        )
      ],
    );
  }
}

Widget buildElevatedButton(BuildContext context) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => FormPage()),
      );
    },
    style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 5),
        primary: Colors.white,
        onPrimary: AppColors.mainColor,
        textStyle: TextStyle(
            color: AppColors.mainColor,
            fontSize: 20,
            fontWeight: FontWeight.bold)),
  );
}
