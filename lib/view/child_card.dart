import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/model/child.dart';

//will define ondelete later
typedef OnDelete();

class ChildCard extends StatefulWidget {
    final Child child;
    final state = _ChildCardState();
    final OnDelete onDelete;

    ChildCard({this.child, this.onDelete});

  @override
  _ChildCardState createState() => state;
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                AppBar(
                  leading: Icon(Icons.people),
                  title: Text("Çocuk ekle"),
                  centerTitle: true,
                  actions: <Widget>[
                    IconButton(icon: Icon(Icons.delete), onPressed: (){},)
                  ],
                ),

              ],
            ),
          ),

        ),
    );
  }
}