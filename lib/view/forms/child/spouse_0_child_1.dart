// first page after startpage if there is no spouse but has children
//spouse may be divorced or dead.
//there may be several spouses in a life-time.
//therefore, let's get the parent name input for each child dynamically
//so, the UI will be different than mockups.

//go to calculation

import 'package:flutter/material.dart';
import 'package:miras/model/person.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/person_form.dart';
import 'package:miras/view/start_page.dart';

// TODO: Add "Sonraki adım" button at the bottom.

class Spouse0Child1 extends StatefulWidget {
  const Spouse0Child1({Key key}) : super(key: key);

  @override
  _Spouse0Child1State createState() => _Spouse0Child1State();
}

class _Spouse0Child1State extends State<Spouse0Child1> {
  List<Person> children = [];
  List<PersonForm> forms = [];

  @override
  Widget build(BuildContext context) {
    forms.clear();
    for (int i = 0; i < children.length; i++) {
      forms.add(PersonForm(
        person: children[i],
        onDelete: () => onDelete(i),
      ));
    }
    return MaterialApp(
      // In the next sprint, children will be added to a bucket list.
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: buildAppBar(),
        body: children.length <= 0
            ? Center(
                child: Text("[+] butonuna tıklayarak çocuk ekleyebilirsiniz."),
              )
            : ListView.builder(
                itemCount: children.length,
                itemBuilder: (_, i) => PersonForm(
                  person: children[i],
                  onDelete: () => onDelete(i),
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

}
