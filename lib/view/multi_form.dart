import 'package:flutter/material.dart';
import 'package:miras/controller/empty_state.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';

import 'answered_forms/form.dart';
class MultiForm extends StatefulWidget {
  @override
  _MultiFormState createState() => _MultiFormState();
}

class _MultiFormState extends State<MultiForm> {
  List<ChildForm> children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: .0,
        leading: Icon(
          Icons.wb_cloudy,
        ),
        title: Text('Çocuk Ekle'),
        actions: <Widget>[
          FlatButton(
            child: Text('Kaydet'),
            textColor: Colors.white,
            onPressed: onSave,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.mainColor,
              AppColors.mainColor.withOpacity(.2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: children.length <= 0
            ? Center(
          child: EmptyState(
            title: 'Hiç çocuk eklenmemiş',
            message: 'Aşağıdaki butona basarak çocuk ekleyiniz',
          ),
        )
            : ListView.builder(
          addAutomaticKeepAlives: true,
          itemCount: children.length,
          itemBuilder: (_, i) => children[i],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAddForm,
        backgroundColor: AppColors.mainColor,
        foregroundColor: Colors.white,
      ),
    );
  }

  ///on form user deleted
  void onDelete(Child _user) {
    setState(() {
      var find = children.firstWhere(
            (it) => it.child == _user,
        orElse: () => null,
      );
      if (find != null) children.removeAt(children.indexOf(find));
    });
  }

  ///on add form
  void onAddForm() {
    setState(() {
      var _user = Child();
      children.add(ChildForm(
        child: _user,
        onDelete: () => onDelete(_user),
      ));
    });
  }

  ///on save forms
  void onSave() {
    if (children.length > 0) {
      var allValid = true;
      children.forEach((form) => allValid = allValid && form.isValid());
      if (allValid) {
        var data = children.map((it) => it.child).toList();
        Navigator.push(
          context,
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (_) =>
                Scaffold(
                  appBar: AppBar(
                    title: Text('Çocukların listesi'),
                  ),
                  body: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (_, i) =>
                        ListTile(
                          leading: CircleAvatar(
                            child: Text(data[i].fullName.substring(0, 1)),
                          ),
                          title: Text(data[i].fullName),
                          subtitle: Text(data[i].email),
                        ),
                  ),
                ),
          ),
        );
      }
    }
  }
}