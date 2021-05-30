import 'package:flutter/material.dart';
import 'package:miras/model/answers.dart';
import 'package:miras/model/child.dart';

//https://www.youtube.com/watch?v=XXScUShqlJc reference

class GlobalState{
  final Map<dynamic , dynamic> _data = <dynamic , dynamic>{};

  static GlobalState instance = new GlobalState._();
  GlobalState._();
  Answers answers = Answers();
  List<Child> childs = [];

  set(dynamic key , dynamic value ) => _data[key] = value;
  get(dynamic key) => _data[key];
}