import 'package:flutter/material.dart';
import 'package:miras/constants.dart';
import 'package:miras/my_flutter_app_icons.dart';

class StartPage extends StatefulWidget {
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
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
           child: buildHeader(),
          ),
        ],
      ),
    );
  }

  Column buildHeader() {
    return Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(MyFlutterApp.account_circle, color: Colors.white),
                      onPressed: null,
                    ),

                  ],
                ),
              ),
            ],
          );
  }
}
