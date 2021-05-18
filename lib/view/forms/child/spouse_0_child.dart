// first page after startpage if there is no spouse but has children

import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

class Spouse0Child extends StatefulWidget {
  const Spouse0Child({Key key}) : super(key: key);

  @override
  _Spouse0ChildState createState() => _Spouse0ChildState();
}

class _Spouse0ChildState extends State<Spouse0Child> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: buildAppBar(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text("Miras Payı Hesaplayıcı"),
      backgroundColor: AppColors.mainColor,
      actions: <Widget>[
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
