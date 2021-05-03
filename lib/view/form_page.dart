import 'package:flutter/material.dart';
import '../model/constants.dart';

// https://www.youtube.com/watch?v=OtrWXLfGtqE
// https://www.youtube.com/watch?v=HMqye4R-4c4
// https://www.youtube.com/watch?v=yG3WiFu2aUE
// https://www.youtube.com/watch?v=teyr-2tl1Wo
// https://www.youtube.com/watch?v=a2MzkViPOio

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  // count holds how many dynamic form rows
  int count;

  @override
  void initState() {
    super.initState();
    count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
        ),

        //Background decoration:
        //Image.asset("assets/images/logo.png"),
        buildHeaderDetails(),
      ]),
    );
  }

  Column buildHeaderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildHeader(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
              "Miras paylarını hesaplamak için aşağıdaki bilgileri doldurunuz:",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
        IconButton(
          icon: Icon(Icons.account_circle, color: Colors.white),
          onPressed: null,
        ),
      ],
    );
  }
}
