import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import '../header_design.dart';
import 'has_no_spouse_or_children.dart';

class SpouseAndChildren extends StatefulWidget {
  const SpouseAndChildren({Key key}) : super(key: key);

  @override
  _SpouseAndChildrenState createState() => _SpouseAndChildrenState();
}

class _SpouseAndChildrenState extends State<SpouseAndChildren> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: <Widget>[
            Container(
              decoration: buildHeaderDecoration(),
              padding: EdgeInsets.only(top: 25),
              child: Stack(children: <Widget>[
                buildHeaderDetails(),
              ]),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: buildElevatedButton(context),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

ElevatedButton buildElevatedButton(BuildContext context) {
  return ElevatedButton(
    child: Text('SONRAKİ ADIM'),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NoSpouseOrChildForm()),
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
