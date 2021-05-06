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
          children.length <= 0
              ? Expanded(
                  child: Center(
                    child: Text(
                        "Lütfen ilgili ebeveynin altındaki ikona basarak çocuk ekleyin"),
                  ),
                )
              : ListView.builder(
                  itemCount: children.length,
                  itemBuilder: (_, i) => ChildCard(
                    child: children[i],
                    onDelete: () => onDelete(i),
                  ),
                ),
        ],

      ),

          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              // Add your onPressed code here!
            },
            label: const Text('Çocuk ekle'),
            icon: const Icon(Icons.add),
            backgroundColor: AppColors.mainColor,
          ),
        );

  }

  void onDelete(int index) {
    setState(() {
      children.removeAt(index);
    });
  }
}
