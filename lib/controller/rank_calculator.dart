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

  String calculateRates(List<Person> people) {
    return people.length.toString();

    /*for (final i in people) {
      return('$i' + "Bitti");
      }*/
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
