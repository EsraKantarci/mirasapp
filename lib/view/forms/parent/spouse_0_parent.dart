// page after spouse_1_child_0

//TODO: add child button dynamically if the answer value is no
//if 2 of them alive --> go spouse_1_parent_2
//if 1 of them alive --> go spouse_1_parent 1


// first page after startpage if there is no spouse but has children
//spouse may be divorced or dead.
//there may be several spouses in a life-time.
//therefore, let's get the parent name input for each child dynamically
//so, the UI will be different than mockups.

//go to calculation

import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/controller/rank_calculator.dart';
import 'package:miras/model/person.dart';
import 'package:miras/model/constants/constants.dart';
import 'package:miras/view/forms/parent_form.dart';
import 'package:miras/view/model/descendent_adder.dart';
import 'package:miras/view/result/result.dart';
import 'package:miras/view/start_page.dart';

import '../parent_form.dart';

// TODO: Add "Sonraki adım" button at the bottom.

class Spouse0Parent extends StatefulWidget {
  const Spouse0Parent({Key key}) : super(key: key);

  @override
  _Spouse0ParentState createState() => _Spouse0ParentState();
}

class _Spouse0ParentState extends State<Spouse0Parent> {
  List<Person> children = [];
  List<GrandparentForm> forms = [];
  int childCount = 2;
  String name = "Eşi ölü";

  @override
  Widget build(BuildContext context) {
    GlobalState.instance.answers.hasSpouse = -1;
    GlobalState.instance.answers.spouseName = name;
    forms.clear();
    print(childCount);


    for (int i = 0; i < childCount.toInt(); i++) {
      setState(() {
        print("çocuk ekledim");
        children.add(Person());
      });

      forms.add(GrandparentForm(
        person: children[i],
      ));

      childCount--;
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // In the next sprint, children will be added to a bucket list.
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: buildAppBar(),

        body:
        SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: <Widget>[
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: children.length,
                itemBuilder: (_, i) => GrandparentForm(
                  person: children[i],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildElevatedButton(
                          context),
                    ),
                  ),

                ),
              ),
            ],
          ),
        ),


      ),
    );
  }

  void onDelete(int index) {
    setState(() {
      children.removeAt(index);
    });
  }


  AppBar buildAppBar() {
    return AppBar(
      title: Text("2. Derece Akrabalar"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[

        IconButton(
          icon: Icon(
            //Step: 1
            Icons.looks_3,
            color: Colors.white,
          ),
          onPressed: () {
            //maybe toasting "Adım: 2'desiniz" is a good idea.
          },
        )
      ],
    );
  }


  Widget buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: Text('SONRAKİ ADIM'),
      onPressed: () {
        GlobalState.instance.people.add(Person(id: GlobalState.instance.idMatch.length + 1,
            name: GlobalState.instance.answers.spouseName, isAlive: 1, parentId: -1,
            rank: 0));
        GlobalState.instance.idMatch.add(GlobalState.instance.answers.spouseName);
        List<int> descendentsList = GlobalState.instance.deadsWithChildren.keys.toList();
        if(descendentsList.isNotEmpty){
          print("Gidiyorum:");
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DescendentList()));
        }
        else{
          Calculator calc = Calculator(answers: GlobalState.instance.answers, people: GlobalState.instance.people);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(
              calculatedResults: calc.calculateRates(GlobalState.instance.people),
              resultText: calc.getResult().toString(),
              resultRatesText: calc.getInheritorsRates().toString(),
            )),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultPage()),
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

}