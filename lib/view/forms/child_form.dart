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
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text("Çocuk Formu"),
              backgroundColor: AppColors.mainColor.withOpacity(0.5),

            ),
          ],
        ),
      ),
    );
  }
}
