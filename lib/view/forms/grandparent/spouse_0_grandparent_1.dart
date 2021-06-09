// only 1 grandparent alive
// add children then calculate

// TODO: GRANDPARENT NAMES INPUT WRITER
// TODO: Add "Sonraki adım" button at the bottom.

import 'package:flutter/material.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/answers.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/child_form.dart';
import 'package:miras/view/start_page.dart';

class Spouse0Grandparent1 extends StatefulWidget {
  const Spouse0Grandparent1({Key key}) : super(key: key);

  @override
  _Spouse0Grandparent1State createState() => _Spouse0Grandparent1State();
}

class _Spouse0Grandparent1State extends State<Spouse0Grandparent1> {
  List<Person> children = [];
  List<PersonForm> forms = [];

  @override
  Widget build(BuildContext context) {
    forms.clear();
    for (int i = 0; i < children.length; i++) {
      forms.add(PersonForm(
        child: children[i],
        onDelete: () => onDelete(i),
      ));
    }
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
              buildSpace(),
              buildQuestion("Miras bırakanın anne tarafından büyükannesinin ismi:"),
              buildSpace(),
              buildTextInputMotherOfMother(context),
              buildSpace(),

              buildQuestion("Miras bırakanın anne tarafından büyükbabasının ismi:"),
              buildSpace(),
              buildTextInputFatherOfMother(context),
              buildSpace(),

              buildQuestion("Miras bırakanın baba tarafından büyükannesinin ismi:"),
              buildSpace(),
              buildTextInputMotherOfFather(context),
              buildSpace(),

              buildQuestion("Miras bırakanın baba tarafından büyükbabasının ismi:"),
              buildSpace(),
              buildTextInputFatherOfFather(context),
              buildSpace(),

              Expanded(
                child: children.length <= 0
                    ? Center(
                  child: Text(
                      "[+] butonuna tıklayarak çocuk ekleyebilirsiniz."),
                )
                    : ListView.builder(
                  itemCount: children.length,
                  itemBuilder: (_, i) => PersonForm(
                    child: children[i],
                    onDelete: () => onDelete(i),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.mainColor,
          child: Icon(Icons.add),
          onPressed: onAdd,
        ),
      ),
    );
  }

  void onDelete(int index) {
    setState(() {
      children.removeAt(index);
    });
  }

  void onAdd() {
    setState(() {
      children.add(Person());
    });
  }

  void onSave() {
    forms.forEach((form) => form.isValid());
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Miras Payı Hesaplayıcı"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
        TextButton(
          child: Text(
            'Kaydet',
            style: TextStyle(
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 16),
          ),
          onPressed: onSave,
        ),
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

  Container buildTextInputMotherOfMother(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {},
        decoration: InputDecoration(
          hintText: "Miras bırakanın anne tarafından büyükannesinin ismini giriniz...",
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

  Container buildTextInputFatherOfMother(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {},
        decoration: InputDecoration(
          hintText: "Miras bırakanın anne tarafından büyükbabasının ismini giriniz...",
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
  Container buildTextInputMotherOfFather(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {},
        decoration: InputDecoration(
          hintText: "Miras bırakanın baba tarafından büyükannesinin ismini giriniz...",
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
  Container buildTextInputFatherOfFather(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: TextField(
        onChanged: (text) {},
        decoration: InputDecoration(
          hintText: "Miras bırakanın baba tarafından büyükbabasının ismini giriniz...",
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


Widget buildElevatedButton(BuildContext context) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StartPage()),
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

