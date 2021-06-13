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

  Iterable<Person> peopleIterable;

  String calculateRates(List<Person> people) {
    peopleIterable = people.toList();
    var len = people.length.toString();
    var lenIt = peopleIterable.length.toString();

    for (String key in peopleIterable.) {
      if (example[key] == 2 && key == 'B') {
        break;
      }
    }

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
