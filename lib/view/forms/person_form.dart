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

  @override
  Widget build(BuildContext context) {
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
                backgroundColor: AppColors.mainColor.withOpacity(0.8),
                actions: <Widget>[
                  IconButton(
                    icon: Text(iconStatus),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      initialValue: widget.person.name,
                      onSaved: (val) => widget.person.name = val,
                      validator: (val) =>
                      val.length > 1 ? null : "Lütfen isim giriniz.",
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
                        buildRadioButton1("Evet", 1, answer1, count),
                        buildRadioButton1("Hayır", 0, answer1, count),
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
                      onChanged: (value) => widget.person.childCount = value.toInt(),

                      // widget.person.childCount = value.toInt(),

                    ),
                  ),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width*0.5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: buildElevatedButton(context, answer1, count, "OK"),
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


  Widget buildElevatedButton(BuildContext context, int answer1, int count, String text) {
    return ElevatedButton(
      child: Text('Bu kişiyi listeye kaydet.'),
      onPressed: () {
        setState(() {
          widget.person.id = count;
          widget.person.isAlive = answer1;
          widget.person.parentId = 1; // Şimdilik
          widget.person.rank = 1;
          iconStatus = text;

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

  Container buildRadioButton1(String text, int val, int group, int count) {
    return Container(
      width: 150,
      child: Row(
        children: <Widget>[
          Radio(
              value: val,
              groupValue: group,
              onChanged: (value) {
                answer1 = value;
               setState(() {
                 GlobalState.instance.children[count].isAlive = value;
               GlobalState.instance.children[count].id = count;
               count = count + 1;
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

