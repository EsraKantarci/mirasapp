import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/child/spouse_0_child_1.dart';

import 'forms/child/spouse_0_child_0.dart';
import 'forms/spouse_child/spouse_1_child_1.dart';
import 'forms/spouse_child/spouse_1_child_0.dart';

// TO-DO: "Lütfen isim giriniz" toaster
class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  //in second sprint we will get them inside the Answer list.
  int answer1 = -1;
  int answer2 = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: (<Widget>[
            Container(
              child: buildQuestion("Miras bırakanın ismi:"),
            ),
            buildSpace(),
            buildTextInput(context),
            buildSpace(),
            buildQuestion("Miras bırakan öldüğünde evli miydi?"),
            buildRadioButton1("Evet", 1, answer1),
            buildRadioButton1("Hayır", 0, answer1),
            buildSpace(),
            buildQuestion(
                "Miras bırakanın altsoyu (çocukları, torunları, evlatlığı vb.) bulunuyor muydu?"),
            buildRadioButton2("Evet", 1, answer2),
            buildRadioButton2("Hayır", 0, answer2),
            buildSpace(),
            buildSpace(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: buildElevatedButton(context, answer1, answer2),
                ),
              ),
            ),
          ]),
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
                answer1 = value;
                GlobalState.instance.answers.hasSpouse = value;
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
                answer2 = value;
                GlobalState.instance.answers.hasChild = value;
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
        height: 5,
      );

  Container buildTextInput(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {
          GlobalState.instance.answers.name = text;
        },
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

Widget buildElevatedButton(BuildContext context, int tester1, int tester2) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      var route;
      if (tester1 == 1 && tester2 == 1) {
        route = Spouse1Child1();
      } else if (tester1 == 1 && tester2 == 0) {
        route = Spouse1Child0();
      } else if (tester1 == 0 && tester2 == 1) {
        route = Spouse0Child1();
      } else {
        route = Spouse0Child0();
      }

      Navigator.push(
        context,
        //switch case?
        MaterialPageRoute(builder: (context) => route),
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
