import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/model/child.dart';

import 'child_card.dart';
import 'header_design.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({Key key}) : super(key: key);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  List<Child> children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: <Widget>[
          Container(
            decoration: buildHeaderDecoration(),
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: <Widget>[
                buildHeaderDetails(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
