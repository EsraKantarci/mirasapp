import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/forms/spouse_child/spouse_1_child_1.dart';
import 'package:miras/view/result/result.dart';

import '../forms/spouse_grandparent/spouse_1_grandparent_1.dart';

void main() => runApp(new MaterialApp(home: MyList()));

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  int value = 0;
  double childCount = 0;
  int answer1 = -1;
  int answer2 = -1;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
      ),
      body: Column(
        children: [
          buildQuestion("Miras bırakan öldüğünde evli miydi?"),
          buildRadioButton1("Evet", 1, answer1),
          buildRadioButton1("Hayır", 0, answer1),
          buildQuestion("Miras bırakanın çocuğu var mı?"),
          buildRadioButton2("Evet", 1, answer2),
          buildRadioButton2("Hayır", 0, answer2),
          buildQuestion("Kaç çocuğu var?"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: SpinBox(
              min: 0,
              max: 40,
              value: childCount,
              onChanged: (value) => childCount = value,
            ),
          ),
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
        ],
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context, int answer1, int answer2) {
    return ElevatedButton(
      child: Text('SONRAKİ ADIM'),
      onPressed: () {
        var route;
        if (answer1 == 1 && answer2 == 1) {
          GlobalState.instance.answers.childCount = childCount.toInt();
          route = Spouse1Child1();
        } else {
          route = Spouse1Child1();
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
                if (answer2 == 0) {
                  setState(() {
                    childCount = 0;
                  });
                }
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
}
