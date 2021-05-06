import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';
import 'package:miras/view/answered_forms/has_no_spouse_or_children.dart';
import 'package:miras/view/home_page.dart';

import 'header_design.dart';

// https://www.youtube.com/watch?v=mLAY8sp-IoE
// https://www.youtube.com/watch?v=H2pVgDjDrxQ

// TO-DO: USE FLEX FOR THE LAYOUT FOR SCROLLABLE CONTAINER

//Enum is a better approach for choices
// so we can change context with less effort in the future.
enum SpouseAnswer{
  yes, no
}
enum ChildAnswer{
  yes, no
}


class StartPage extends StatefulWidget {
  const StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {

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
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: buildMainColumn(context),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[
                //bottom will be here
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildMainColumn(BuildContext context) {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    "Miras bırakanın ismi:",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
                space10(),
                Container(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: TextField(
                    onChanged: (text) {},
                    decoration: InputDecoration(
                      hintText: "Miras bırakanın ismini giriniz...",
                      hintStyle: TextStyle(fontWeight: FontWeight.normal),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                space10(),
                Text(
                  "Miras bırakan evli miydi?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
                buildHasSpouse(),
                space10(),
                Text(
                  "Miras bırakanın altsoyu (çocuğu/çocukları/torunları vb.) var mıydı?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
                buildHasChildren(),
                space10(),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: buildElevatedButton(context),
                  ),
                ),
              ],
            );
  }

  SizedBox space10() {
    return SizedBox(
                height: 10,
              );
  }



  Widget buildHasSpouse() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Radio(value: null, groupValue: null, onChanged: null),
            Text("Evet",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          ],
        ),
        Row(
          children: <Widget>[
            Radio(value: null, groupValue: null, onChanged: null),
            Text("Hayır",
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
          ],
        ),
      ],
    );
  }
  }

  Container buildHasChildren() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Radio(value: null, groupValue: null, onChanged: null),
              Text("Evet",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ],
          ),
          Row(
            children: <Widget>[
              Radio(value: null, groupValue: null, onChanged: null),
              Text("Hayır",
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.normal)),
            ],
          ),
        ],
      ),
    );
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
