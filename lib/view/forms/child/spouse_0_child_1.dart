// same with spouse_0_child with spouse = 1

//there may be several spouses in a life-time.
//therefore, let's get the parent name input for each child dynamically
//so, the UI will be different than mockups.

// TODO: Add "Sonraki adım" button at the bottom.

import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/person.dart';
import 'package:miras/model/answers.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/person_form.dart';
import 'package:miras/view/forms/spouse_child/spouse_1_child_1_list.dart';
import 'package:miras/view/start_page.dart';

class Spouse0Child1 extends StatefulWidget {
  const Spouse0Child1({Key key}) : super(key: key);

  @override
  _Spouse0Child1State createState() => _Spouse0Child1State();
}

class _Spouse0Child1State extends State<Spouse0Child1> {
  List<Person> children = [];
  List<PersonForm> forms = [];
  double childCount = 0;
  String name = "Eşi ölü";

  @override
  Widget build(BuildContext context) {

    GlobalState.instance.answers.spouseName = name;
    return MaterialApp(
      // In the next sprint, children will be added to a bucket list.
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //To check if answer list is accessed
              //Text(GlobalState.instance.answers.toString()),

              buildSpace(),
              buildQuestion("Miras bırakanın kaç çocuğu vardı?"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SpinBox(
                  min: 0,
                  max: 40,
                  value: childCount,
                  onChanged: (value) =>
                  GlobalState.instance.answers.childCount = value.toInt(),
                ),
              ),
              buildSpace(),
              buildSpace(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: buildElevatedButton(context, childCount),
                  ),
                ),
              ),

            ],
          ),
        ),

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

  Container buildTextInput(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {
          GlobalState.instance.answers.spouseName = text;
          name = text;
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

  SizedBox buildSpace() => SizedBox(
    height: 10,
  );
}


Widget buildElevatedButton(BuildContext context, double childCount) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      GlobalState.instance.people.add(Person(id: GlobalState.instance.idMatch.length + 1,
          name: GlobalState.instance.answers.spouseName, isAlive: 0, parentId: -1,
          rank: 0));
      GlobalState.instance.idMatch.add(GlobalState.instance.answers.spouseName);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Spouse1Child1List()),
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

