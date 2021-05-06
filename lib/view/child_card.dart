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
  @override @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
        ),
    );
  }
}