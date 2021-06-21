import 'package:flutter/material.dart';
import 'package:miras/model/answers.dart';
import 'package:miras/model/person.dart';

//https://www.youtube.com/watch?v=XXScUShqlJc reference

class GlobalState{
  final Map<dynamic , dynamic> _data = <dynamic , dynamic>{};

  static GlobalState instance = new GlobalState._();
  GlobalState._();

  Answers answers = Answers();

  List<Person> children = [];
  List<Person> people = [];
  List<String> idMatch = [];

  //parent id, children count
  Map<int, int> deadsWithChildren = new Map();
  Map<String, int> deads = new Map();

  //id list to keep parental info in person form
  List<int> parentalInfo = [];

  Map<String, double> rates = new Map();
  Map<String, double> hiddenRates = new Map();


  set(dynamic key , dynamic value ) => _data[key] = value;
  get(dynamic key) => _data[key];


}