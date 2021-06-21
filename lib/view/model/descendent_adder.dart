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
import 'package:miras/view/forms/person_form.dart';
import 'package:miras/view/result/result.dart';
import 'package:miras/view/start_page.dart';
import 'package:grouped_list/grouped_list.dart';


// TODO: Add "Sonraki adım" button at the bottom.

class DescendentList extends StatefulWidget {
  const DescendentList({Key key}) : super(key: key);

  @override
  _DescendentListState createState() => _DescendentListState();
}

class _DescendentListState extends State<DescendentList> {

  List<Person> children = [];
  List<PersonForm> forms = [];
  int childCount = 0; //GlobalState.instance.answers.childCount;
  String parentName;
  List<int> parents = [];
  int descendentCount = 0;
  var peopleIterable = GlobalState.instance.people.asMap();

  @override
  Widget build(BuildContext context) {
    forms.clear();
    print("içerideyim");
    print(GlobalState.instance.deadsWithChildren.toString());
    if(GlobalState.instance.deadsWithChildren.containsValue(-1)){
      print("parent mirası bırakan görünüyor: " + GlobalState.instance.deadsWithChildren.keys.toString());
    }

    print("ya durum şu: " + GlobalState.instance.deadsWithChildren.keys.toString());
    parents = GlobalState.instance.deadsWithChildren.keys.toList();
    print(parents.length);
    print(childCount);
    print("liste şu: " + GlobalState.instance.deadsWithChildren.toString());

    for(int i = 0; i<parents.length; i++){
      childCount = childCount + GlobalState.instance.deadsWithChildren[parents[i]];
    }

    print("çocuk sayısı: " + childCount.toString());


    for (int i = 0; i < childCount.toInt(); i++) {
      print("anlık liste: " + GlobalState.instance.deadsWithChildren.toString());
      descendentCount = GlobalState.instance.deadsWithChildren[parents.first];
      peopleIterable = GlobalState.instance.people.asMap();
      Person parent = peopleIterable[parents.first-1];
      parentName = parent.name;
      print("Parent name: " + parentName);

      for(int j = 0; j <descendentCount.toInt(); j++) {
        setState(() {
          print("çocuk ekledim şuna: " + parentName);
          children.add(Person(parentId: parent.id));
          GlobalState.instance.parentalInfo.add(parent.id);
          forms.add(PersonForm(
            person: children[j],
          ));
        });


      }

      childCount=childCount-descendentCount;
      print("siliyorum: " + GlobalState.instance.deadsWithChildren.toString());
      GlobalState.instance.deadsWithChildren.remove(parents.first);
      parents = GlobalState.instance.deadsWithChildren.keys.toList();

      print("sildim: " + GlobalState.instance.deadsWithChildren.toString());
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
                itemBuilder: (_, i) => PersonForm(
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
        List<int> descendentsList = GlobalState.instance.deadsWithChildren.keys.toList();

        //TODO: şuraya bir condition lazım recursion için:
        int descendentCount = 0;
        if(descendentCount>0){
          for(int i in descendentsList){
            print("Gidiyorum:");
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DescendentList()));
          }

        }
        else{
          Calculator calc = Calculator(answers: GlobalState.instance.answers, people: GlobalState.instance.people);

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ResultPage(
              calculatedResults: calc.calculateRates(GlobalState.instance.people),
              resultText: calc.getResult().toString(),
              resultRatesText: calc.getInheritorsRates().toString(),
            ),
            ),
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
