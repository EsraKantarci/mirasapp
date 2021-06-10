import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miras/controller/global_state.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';


typedef OnDelete(); //will be defined in another page

class PersonForm extends StatefulWidget {
  final Person child;
  final state = _PersonFormState();
  final OnDelete onDelete;

  PersonForm({this.child, this.onDelete});

  @override
  _PersonFormState createState() => state;

  bool isValid() => state.validate();
}

class _PersonFormState extends State<PersonForm> {
  final form = GlobalKey<FormState>();
  int count = 0;
  int tester1 = -1;
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
                title: Text("Kişi Formu"),
                centerTitle: true,
                backgroundColor: AppColors.mainColor.withOpacity(0.8),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      onChanged: (a)=>GlobalState.instance.children[0].parentName = a,
                      initialValue: widget.child.parentName,
                      onSaved: (val) => widget.child.parentName = val,
                      validator: (val) =>
                          val.length > 1 ? null : "Lütfen isim giriniz.",
                      decoration: InputDecoration(
                          labelText: "Ebeveynin İsmi: ",
                          hintText:
                              "Miras bırakanın haricindeki ebeveynin ismini giriniz"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      initialValue: widget.child.childName,
                      onSaved: (val) => widget.child.childName = val,
                      validator: (val) =>
                          val.length > 1 ? null : "Lütfen isim giriniz.",
                      decoration: InputDecoration(
                          labelText: "Çocuğun İsmi: ",
                          hintText: "Çocuğun ismini giriniz"),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Çocuk hala yaşıyor mu?",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black87,
                          ),
                        )),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        buildRadioButton1("Evet", 1, tester1),
                        buildRadioButton1("Hayır", 0, tester1),
                      ],
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

  Container buildRadioButton1(String text, int val, int group) {
    return Container(
      width: 150,
      child: Row(
        children: <Widget>[
          Radio(
              value: val,
              groupValue: group,
              onChanged: (value) {
                tester1 = value;
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
