// first page after startpage if there is no spouse but has children
//spouse may be divorced or dead.
//there may be several spouses in a life-time.
//therefore, let's get the parent name input for each child dynamically
//so, the UI will be different than mockups.

import 'package:flutter/material.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/child_form.dart';

class Spouse0Child extends StatefulWidget {
  const Spouse0Child({Key key}) : super(key: key);

  @override
  _Spouse0ChildState createState() => _Spouse0ChildState();
}

class _Spouse0ChildState extends State<Spouse0Child> {
  List<Child> children = [];
  List<ChildForm> forms = [];

  @override
  Widget build(BuildContext context) {
    forms.clear();
    for (int i = 0; i < children.length; i++) {
      forms.add(ChildForm(
        child: children[i],
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
                itemBuilder: (_, i) => ChildForm(
                  child: children[i],
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
      children.add(Child());
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
}
