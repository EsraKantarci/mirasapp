// go to spouse_0_parent

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/parent/spouse_0_parent.dart';
import 'package:miras/view/forms/parent/spouse_0_parent_0.dart';
import 'package:miras/view/forms/parent/spouse_0_parent_1.dart';
import 'package:miras/view/forms/spouse_child/spouse_1_child_1.dart';

class Spouse0Child0 extends StatefulWidget {
  Spouse0Child0({Key key}) : super(key: key);

  @override
  _Spouse0Child0State createState() => _Spouse0Child0State();
}

class _Spouse0Child0State extends State<Spouse0Child0> {
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

            buildQuestion("Miras bırakanın annesinden ya da babasından en az biri sağ mı?"),
            buildRadioButton1("Evet", 1, answer1),
            buildRadioButton1("Hayır", 0, answer1),
            buildSpace(),
            buildQuestion(
                "Miras bırakanın anne babasının altsoyu (miras bırakanın kardeşi, yeğenleri vb.) bulunuyor mu?"),
            buildRadioButton2("Evet", 1, answer2),
            buildRadioButton2("Hayır", 0, answer2),
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
                GlobalState.instance.answers.hasParent = value;
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
                GlobalState.instance.answers.hasSecondRank = value;
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
            Icons.looks_3,
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

Widget buildElevatedButton(BuildContext context, int answer1, int answer2) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      var route;
      if (answer1 == 1 ) {
        route = Spouse0Parent1();
      }
      else if (answer1 == 0 && answer2 == 1) {
        route = Spouse0Parent0();
      } else {
        route = Spouse0Parent();
      }
      Navigator.push(
        context,
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
