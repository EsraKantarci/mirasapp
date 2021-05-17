import 'package:flutter/material.dart';
import 'package:miras/model/child.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/forms/child_form.dart';

class FormPage extends StatelessWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Çocuk Formu",
      color: AppColors.backgroundColor,
      home: Scaffold(
        body: ChildForm(child: Child() ),
      ),
    );
  }
}
