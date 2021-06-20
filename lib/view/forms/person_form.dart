import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinbox/flutter_spinbox.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/person.dart';
import 'package:miras/model/constants.dart';

// TODO: Sağ üstte id ya da countı yazdır

typedef OnDelete(); //will be defined in another page

class PersonForm extends StatefulWidget {
  final Person person;
  final state = _PersonFormState();
  final OnDelete onDelete;

  PersonForm({this.person, this.onDelete});

  @override
  _PersonFormState createState() => state;

  bool isValid() => state.validate();
}

class _PersonFormState extends State<PersonForm> {
  final form = GlobalKey<FormState>();
  var count = 0;
  int answer1 = -1;
  var iconStatus = "?";
  var savingText = "Bu kişiyi listeye kaydet";
  List<String> parentNameList = GlobalState.instance.deads.keys.toList();


  @override
  Widget build(BuildContext context) {
    String parentName = parentNameList.first;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Form(
          key: form,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(

                leading: Icon(Icons.people_alt),
                title: Text("Kişi Ekleme Formu"),
                centerTitle: true,
                backgroundColor: AppColors.mainColor.withOpacity(0.9),
                actions: <Widget>[
                  IconButton(
                    icon: Text(iconStatus),
                  ),
                ],
              ),
              Column(
                children: [
                  buildInfo("Ebeveyn İsmi: " + parentName),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(

                      onChanged: (value) {
                        print("isim şu---"+ widget.person.name);
                        widget.person.name = value.toString();
                      },

                      validator: (value) =>
                          value.length > 1 ? null : "Lütfen isim giriniz.",
                      decoration: InputDecoration(
                          labelText: "Çocuğun İsmi: ",
                          hintText: "Çocuğun ismini giriniz"),
                    ),
                  ),
                  buildQuestion("Bu kişi hala hayatta mı?"),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildRadioButton1("Evet", 1, answer1),
                        buildRadioButton1("Hayır", 0, answer1),
                      ],
                    ),
                  ),
                  buildQuestion("Bu kişinin kaç çocuğu var?"),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SpinBox(
                      min: 0,
                      max: 40,
                      value: 0,
                      onChanged: (value) =>
                          widget.person.childCount = value.toInt(),
                      // widget.person.childCount = value.toInt(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildElevatedButton(
                              context, answer1, count, "✓", "Bu kişi kaydedildi", widget.person),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildElevatedButton(
      BuildContext context, int answer1, int count, String text, String saveText, Person person) {
    return ElevatedButton(
      child: Text(savingText),
      onPressed: () {
        setState(() {
          // parent id -1 şimdilik
          print("ID MATCH: " + GlobalState.instance.idMatch.toString());
           GlobalState.instance.people.add(Person(id: GlobalState.instance.idMatch.length + 1,
              name: person.name, isAlive: answer1, parentId: -1,
              rank: 1, childCount: person.childCount));

            GlobalState.instance.idMatch.add(person.name);
            if(person.isAlive == 0){
              GlobalState.instance.deadsWithChildren[GlobalState.instance.idMatch.length] = person.childCount;
            }

          print("son id: " + GlobalState.instance.idMatch.last);
          iconStatus = text; // sonra bunu ikona çeviririz
          savingText = saveText;

          print("Anlık insanlar: "+GlobalState.instance.people.toString());
          print("Anlık ölülerin çocuk sayısı: " + GlobalState.instance.deadsWithChildren.toString());
        });
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),
          padding: EdgeInsets.all(5),
          primary: AppColors.mainColor.withOpacity(0.8),
          onPrimary: AppColors.backgroundColor,
          textStyle: TextStyle(
              color: AppColors.mainColor,
              fontSize: 15,
              fontWeight: FontWeight.bold)),
    );
  }

  Padding buildQuestion(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black87,
            ),
          )),
    );
  }

  Padding buildInfo(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          )),
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
                widget.person.isAlive = value;
                setState(() {
                });
              }),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  // form validator for saving it to a list
  //empty state will be added for the debug on validation
  bool validate() {
    var valid = form.currentState.validate();
    if (valid) {
      form.currentState.save();
    }
    return valid;
  }
}
