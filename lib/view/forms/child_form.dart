import 'package:flutter/material.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';

typedef OnDelete();

class ChildForm extends StatefulWidget {
  final Child child;
  final state = _ChildFormState();
  final OnDelete onDelete;

  ChildForm({this.child, this.onDelete});

  @override
  _ChildFormState createState() => state;
}

class _ChildFormState extends State<ChildForm> {
  final form = GlobalKey<FormState>();
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
                title: Text("Çocuk Formu"),
                centerTitle: true,
                backgroundColor: AppColors.mainColor.withOpacity(0.5),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: (){},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
