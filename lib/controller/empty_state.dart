import 'package:flutter/material.dart';
import 'package:miras/model/constants.dart';

//https://github.com/putraxor/flutter_multipage_form reference

class EmptyState extends StatelessWidget {
  final String title, message;
  EmptyState({this.title, this.message});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(16),
      elevation: 16,
      color: AppColors.backgroundColor.withOpacity(.95),
      shadowColor: AppColors.mainColor.withOpacity(.5),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title, style: Theme.of(context).textTheme.headline),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(message),
            ),
          ],
        ),
      ),
    );
  }
}