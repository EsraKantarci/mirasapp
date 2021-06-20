// page after spouse_1_child_0

//TODO: add child button dynamically if the answer value is no
//if 2 of them alive --> go spouse_1_parent_2
//if 1 of them alive --> go spouse_1_parent 1

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/model/person.dart';
import 'package:miras/view/forms/spouse_child/spouse_1_child_1.dart';
import 'package:miras/view/forms/spouse_parent/spouse_1_parent_0.dart';
import 'package:miras/view/forms/spouse_parent/spouse_1_parent_1.dart';
import 'package:miras/view/result/result.dart';
import 'package:miras/view/start_page.dart';

class Spouse1Parent extends StatefulWidget {
  Spouse1Parent({Key key}) : super(key: key);

  @override
  _Spouse1ParentState createState() => _Spouse1ParentState();
}

class _Spouse1ParentState extends State<Spouse1Parent> {
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
        //in order to debug overflow, we added scrollview
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (<Widget>[
              buildQuestion("Miras bırakanın annesinin ismi:"),
              buildSpace(),
              buildTextInputMother(context),
              buildSpace(),
              buildQuestion("Miras bırakanın annesi sağ mı?"),
              buildRadioButton1("Evet", 1, answer1),
              buildRadioButton1("Hayır", 0, answer1),
              buildSpace(),
              buildQuestion("Miras bırakanın babasının ismi:"),
              buildSpace(),
              buildTextInputFather(context),
              buildSpace(),
              buildQuestion("Miras bırakanın  babası sağ mı?"),
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
            //Step: 2
            Icons.looks_two,
            color: Colors.white,
          ),
          onPressed: () {
            //maybe toasting "Adım: 2'desiniz" is a good idea.
          },
        )
      ],
    );
  }
}

Widget buildElevatedButton(BuildContext context, answer1, answer2) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      var route;
      if (answer1 == 1 && answer2 == 1) {
        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.motherName,
            isAlive: 1,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.motherName);

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.fatherName,
            isAlive: 1,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.fatherName);
        route = ResultPage();
      } else if (answer1 == 1 && answer2 == 0) {
        route = Spouse1Parent1();

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.motherName,
            isAlive: 1,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.motherName);

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.fatherName,
            isAlive: 0,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.fatherName);
      } else if (answer1 == 0 && answer2 == 1) {
        route = Spouse1Parent1();

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.motherName,
            isAlive: 0,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.motherName);

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.fatherName,
            isAlive: 1,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.fatherName);
      } else {
        route = Spouse1Parent1();

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.motherName,
            isAlive: 0,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.motherName);

        GlobalState.instance.people.add(Person(
            id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.fatherName,
            isAlive: 0,
            parentId: -1,
            rank: 2));
        GlobalState.instance.idMatch
            .add(GlobalState.instance.answers.fatherName);

        route = Spouse1Parent0();
      }
      if (answer1 == 1 && answer2 == 1) {
        Calculator calc = Calculator(
            answers: GlobalState.instance.answers,
            people: GlobalState.instance.people);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultPage(
                    calculatedResults:
                    calc.calculateRates(GlobalState.instance.people),
                    resultText: calc.getResult().toString(),
                    resultRatesText: calc.getInheritorsRates().toString(),
                  )),
        );
      }
      else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      );
    }},
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

Container buildTextInputSpouse(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    child: TextField(
      onChanged: (text) {
        GlobalState.instance.answers.spouseName = text;
      },
      decoration: InputDecoration(
        hintText: "Miras bırakanın eşinin ismini giriniz...",
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

Container buildTextInputMother(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    child: TextField(
      onChanged: (text) {
        GlobalState.instance.answers.motherName = text;
      },
      decoration: InputDecoration(
        hintText: "Miras bırakanın annesinin ismini giriniz...",
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

Container buildTextInputFather(BuildContext context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.1,
    child: TextField(
      onChanged: (text) {
        GlobalState.instance.answers.fatherName = text;
      },
      decoration: InputDecoration(
        hintText: "Miras bırakanın babasının ismini giriniz...",
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
