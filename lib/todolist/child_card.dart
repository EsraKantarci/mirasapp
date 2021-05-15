import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

import 'child.dart';

//will define ondelete later
typedef OnDelete();

//TODO: Kişi hayatta değilse sağ altta çocuk ekle ikonu aktif olacak.

class ChildCard extends StatefulWidget {
    final Child child;
    final state = _ChildCardState();
    final OnDelete onDelete;

    ChildCard({this.child, this.onDelete});

  @override
  _ChildCardState createState() => state;

  bool isValid() => state.validate();
}

class _ChildCardState extends State<ChildCard> {
  final form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Card(
          child: Form(
            key: form,
            child: Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  AppBar(
                    backgroundColor: AppColors.mainColor,
                    leading: Icon(Icons.people),
                    title: Text("X'e Çocuk ekle"),
                    centerTitle: true,
                    actions: <Widget>[
                      IconButton(icon: Icon(Icons.delete), onPressed: widget.onDelete,)
                    ],

                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("İsim: ", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.mainColor,
                      ),),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: TextField(
                        onChanged: (text) {},
                        decoration: InputDecoration(
                          hintText: "Miras bırakanın ismini giriniz...",
                          hintStyle: TextStyle(fontWeight: FontWeight.normal),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Kişi hayatta mı?",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                  buildIsAlive(),
                ],
              ),
            ),
          ),

        ),
    );
  }

  bool validate(){
    var valid = form.currentState.validate();
    if(valid){
      form.currentState.save();
      return valid;
    }
  }
}

Widget buildIsAlive() {
  return Column(
    children: <Widget>[
      Row(
        children: <Widget>[
          Radio(value: null, groupValue: null, onChanged: null),
          Text("Evet",
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
        ],
      ),
      Row(
        children: <Widget>[
          Radio(value: null, groupValue: null, onChanged: null),
          Text("Hayır",
              style:
              TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
        ],
      ),
    ],
  );
}
