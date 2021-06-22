// Ref: https://github.com/JideGuru/FlutterTravel/

import 'package:flutter/material.dart';
import 'package:miras/model/constants/constants.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,

        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.grey,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          hintText: "Örn: Vasiyetname",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.blueGrey[300],
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.indigo[300],
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
      ),
    );
  }
}