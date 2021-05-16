import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

import 'forms/form_page.dart';
import 'home_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


  ElevatedButton buildElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: Text('SONRAKİ ADIM'),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => FormPage()),
        );
      },
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 5),
          primary: Colors.white,
          onPrimary: AppColors.mainColor,
          textStyle: TextStyle(
              color: AppColors.mainColor,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    );
  }
