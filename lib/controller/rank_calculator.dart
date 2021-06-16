import 'dart:math';
import 'package:miras/model/answers.dart';
import 'package:miras/model/person.dart';

import 'global_state.dart';

class Calculator {
  Calculator({this.answers, this.people});

  final Answers answers;
  final List<Person> people;

  String result = "";

  double rates;

  Map<int, Person> peopleIterable;

  String calculateRates(List<Person> people) {
    peopleIterable= people.asMap();
    var len = people.length.toString();
    var lenIt = peopleIterable.length.toString();
    //return peopleIterable[3].toString();


      //rates =
      // return rates.toStringAsFixed(1);
    }

    String getResult() {
      if (GlobalState.instance.answers.hasSpouse == 1) {
        result = "Evli,";
      }
    }

    String getInterpretation() {
      return "";
      /*if (rates >= 25) {
      return "";}*/
    }
  }
