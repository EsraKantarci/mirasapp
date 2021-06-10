import 'package:flutter/material.dart';
import 'package:flutter_spinbox/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/constants.dart';


void main() => runApp(new MaterialApp(home: MyList()));
int answer1 = -1;
int answer2 = -1;

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  int value = 0;
  double childCount = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("MyApp"),
      ),
      body: Column(
        children: [
          buildQuestion("Miras bırakanın çocuğu var mı?"),
          buildRadioButton1("Evet", 1, answer1),
          buildRadioButton1("Hayır", 0, answer1),

          buildQuestion("Kaç çocuğu var?"),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: SpinBox(
              min: 0,
              max: 40,
              value: 0,
              onChanged: (value) => childCount = value,
            ),
          ),
        ],
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



