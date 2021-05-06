import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/model/child.dart';

import 'child_card.dart';

class ChildPage extends StatefulWidget {
  const ChildPage({Key key}) : super(key: key);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: ChildCard(child: Child(),),
    );
  }

}
