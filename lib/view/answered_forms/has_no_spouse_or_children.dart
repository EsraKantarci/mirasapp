import 'package:flutter/material.dart';
import '../../model/constants.dart';
import '../header_design.dart';
import '../home_page.dart';

class NoSpouseOrChildForm extends StatefulWidget {
  const NoSpouseOrChildForm({Key key}) : super(key: key);

  @override
  _NoSpouseOrChildFormState createState() => _NoSpouseOrChildFormState();
}

class _NoSpouseOrChildFormState extends State<NoSpouseOrChildForm> {
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
    ]
    )
      );
  }
}
