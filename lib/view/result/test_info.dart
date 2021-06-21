import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/answers.dart';

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/model/person.dart';
import 'package:miras/view/forms/child/spouse_0_child_1.dart';
import 'package:miras/view/result/result.dart';


// TO-DO: "Lütfen isim giriniz" toaster
class TestPage extends StatefulWidget {
  TestPage({Key key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  //in second sprint we will get them inside the Answer list.
  int answer1 = -1;
  int answer2 = -1;

  Answers testAnswer = Answers(name: "Ölen", hasSpouse: 1, spouseName: "Eşi", hasChild: 1, childCount: 2);


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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width,
                  child: buildElevatedButton(context, testAnswer),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  SizedBox buildSpace() => SizedBox(
    height: 5,
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

Widget buildElevatedButton(BuildContext context, Answers testAnswer) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      GlobalState.instance.people.removeRange(0, GlobalState.instance.people.length);
      GlobalState.instance.answers = testAnswer;
      GlobalState.instance.people.add(Person(id: 1, name: testAnswer.spouseName, isAlive: 1, rank:0, childCount: 2));
      GlobalState.instance.people.add(Person(id: 2, name: "Çocuk1", isAlive: 0, rank:1, childCount: 2));
      GlobalState.instance.people.add(Person(id: 3, name: "Çocuk2", isAlive: 1, rank:1, childCount: 3));
      GlobalState.instance.people.add(Person(id: 4, name: "Anne", isAlive: 1, rank:2, childCount: 2));
      GlobalState.instance.people.add(Person(id: 5, name: "Baba", isAlive: 0, rank:2, childCount: 2));
      GlobalState.instance.people.add(Person(id: 6, name: "Kardeş", isAlive: 0, rank:2, childCount: 0));
      GlobalState.instance.people.add(Person(id: 7, name: "Dede", isAlive: 0, rank:3, childCount: 2));
      GlobalState.instance.people.add(Person(id: 8, name: "Dayı", isAlive: 1, rank:3, childCount: 0));
      GlobalState.instance.people.add(Person(id: 9, name: "Torun1", isAlive: 0, rank:1, parentId: 2, childCount: 1));
      GlobalState.instance.people.add(Person(id: 10, name: "Torun2", isAlive: 1, rank:1, parentId: 2, childCount: 2));
      GlobalState.instance.people.add(Person(id: 11, name: "Torun3", isAlive: 1, rank:1, parentId: 3, childCount: 0));
      GlobalState.instance.people.add(Person(id: 12, name: "Torun4", isAlive: 1, rank:1, parentId: 2, childCount: 2));
      GlobalState.instance.people.add(Person(id: 13, name: "Torun1Çocuğu", isAlive: 1, rank:1, parentId: 9, childCount: 1));


      Calculator calc = Calculator(answers: testAnswer, people: GlobalState.instance.people);

      Navigator.push(
        context,
        //switch case?
        MaterialPageRoute(builder: (context) => ResultPage(
          calculatedResults: calc.calculateRates(GlobalState.instance.people),
          resultText: calc.getResult().toString(),
          resultRatesText: calc.getInheritorsRates().toString(),
        )),
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


