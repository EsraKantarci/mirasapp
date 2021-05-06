import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/header_design.dart';
import 'child.dart';
import 'child_card.dart';

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
            onPressed: onAddForm,
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

  void onAddForm(){
    setState(() {
      children.add(Child());
    });
  }
}