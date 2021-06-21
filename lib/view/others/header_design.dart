import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miras/model/constants/constants.dart';


BoxDecoration buildHeaderDecoration() {
    return BoxDecoration(
      color: AppColors.mainColor,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
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
