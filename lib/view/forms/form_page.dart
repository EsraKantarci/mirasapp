import 'package:flutter/material.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/child_form.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  List<Child> children = [];
  List<ChildForm> forms = [];

  @override
  Widget build(BuildContext context) {
    forms.clear();
    for(int i = 0; i < children.length; i++){
      forms.add(ChildForm(
        child: children[i],
        onDelete: () => onDelete(i),
      ));
    }
    return MaterialApp(
      // gelecekte seçilen ebeveynin ismi ile "X'in Çocuğu" olarak yer alacak
      title: "Çocuk Formu",
      color: AppColors.backgroundColor,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.mainColor,
            title: Text("Çocuk ekleme sayfası"),
            actions: <Widget>[
              FlatButton(
                child: Text('Kaydet'),
                onPressed: onSave,
              ),
            ],

            // Burada düzenlemeleri yapalım, ardından 4.1 haline koyalım
          ),
          body: children.length <= 0
              ? Center(
                  child:
                      Text("[+] butonuna tıklayarak çocuk ekleyebilirsiniz."),
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

  void onAdd(){
    setState(() {
      children.add(Child());
    });
  }

  void onSave(){
    forms.forEach((form) => form.isValid());
  }
}
