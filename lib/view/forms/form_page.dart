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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // gelecekte seçilen ebeveynin ismi ile "X'in Çocuğu" olarak yer alacak
      title: "Çocuk Formu",
      color: AppColors.backgroundColor,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.mainColor,
          title: Text("Çocuk ekleme sayfası"),
          // Burada düzenlemeleri yapalım, ardından 4.1 haline koyalım
        ),
        body: children.length <= 0 ? Center(
          child: Text("Henüz çocuk eklenmedi. [+] butonuna tıklayarak çocuk ekleyebilirsiniz."),
        ):
            ListView.builder(itemCount: children.length,
            itemBuilder: (_, i) => ChildForm(child: children[i]),)
      ),
    );
  }
}
