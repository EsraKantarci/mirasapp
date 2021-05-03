import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

class StartPage extends StatelessWidget {
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
            padding: EdgeInsets.only(top: 25),
            child: Stack(
              children: [
                //Background decoration:
                //Image.asset("assets/images/logo.png"),
                buildHeaderDetails(),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: <Widget>[

              ],
            ),
          ),
        ],
      ),
    );
  }

  Column buildHeaderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text("Miras Payı Hesaplama",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              )),
        ),
        SizedBox(height: 20),
       ],
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(height: 20),
        //Header part will be updated.
      ],
    );
  }
}
