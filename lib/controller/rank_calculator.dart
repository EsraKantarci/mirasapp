import 'dart:collection';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:miras/model/answers.dart';
import 'package:miras/model/person.dart';

import 'global_state.dart';

// TODO: inheritors cannot be appended.

class Calculator {
  Calculator({this.answers, this.people});

  final Answers answers;
  final List<Person> people;

  String result = "";
  List<Map<int, int>> inheritors = [];
  List<Map<int, int>> deceaseds = [];
  double rates;
  int eligibleRank = 3;

  Map<int, Person> peopleIterable;

  String calculateRates(List<Person> people) {
    Map<int, int> mapped = new Map();
    Map<int, int> mappedDied = new Map();
    inheritors.removeRange(0, inheritors.length);
    deceaseds.removeRange(0, deceaseds.length);

    peopleIterable = people.asMap();
    int len = peopleIterable.length;
    Person person;

    //spouse:
    person = peopleIterable[0];
    //we need to add spouse in any case. Rates will change.
    mapped[person.id] = person.rank;


    // keys:
    // mapPerson.keys.toString();
    // List newList = mapPerson.keys.toList();


    //besides spouse:
    for (int i = 1; i < len; i++) {
      person = peopleIterable[i];

      if (person.isAlive == 1) {
        if (person.rank <= eligibleRank) {
          eligibleRank = person.rank;
          mapped[person.id] = person.rank;
        } else {
          //keep checking
          continue;
        }
      } else {
        if (person.rank <= eligibleRank) {
          print(person.toString());
          //person is dead. let's check the other ranks and
          // add the person into deceseads so we can check children then
          mappedDied[person.id] = person.childCount;
        }
        else {
          continue;
        }
      }
    }

    List keyList = mappedDied.keys.toList();




    for(int i=0; i<keyList.length; i++) {
      //key is also id and index of people list
            int key = keyList[i];
            print("key is: " + key.toString());
      print("childcount: " + mappedDied[key].toString());
      //-1 because indexing starts from 0
      Person person = peopleIterable[key-1];

      if (person.childCount > 0) {
        //şimdi parent id'si keyle eşlenenlere bakmamız lazım.
        var matchingParentId = key;

        print("matchingParentId:" + matchingParentId.toString());

        print(people.where((item) =>
            matchingParentId.toString().contains(item.parentId.toString())));

      }
    }
    return keyList.toString();
  }

  //rates =
  // return rates.toStringAsFixed(1);

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

  RateOperator(int rank1, int rank2, double rate1, double rate2,
      double hiddenRate1, double hiddenRate2) {
    // Bunlara return eklemem lazım, bu logici böyle kullanamam.
    // hatta rank calculatorda yer alsa daha mantıklı.

    /*
  rank = 0 => spouse
  rank = 1 => child
  rank = 2 => parents
  rank = 3 => grandparents
  rank = -1 => not alive

 rate = -1 => no rate
  */

    if (rank1 == 0 && rank2 == 1) {
      //Spouse and children
      rate1 = 0.25;
      rate2 = 0.75;
      hiddenRate1 = 1;
      hiddenRate2 = 0.5;
    }

    if (rank1 == 0 && rank2 == 2) {
      //Spouse and parent
      rate1 = 0.5;
      rate2 = 0.5;
      hiddenRate1 = 1;
      hiddenRate2 = 0.25;
    }
    if (rank1 == 0 && rank2 == 3) {
      //Spouse and third degree
      rate1 = 0.75;
      rate2 = 0.25;
      hiddenRate1 = 0.75;
      hiddenRate2 = -1;
    }

    if (rank1 == 1 && rank2 == -1) {
      //Only spouse
      rate1 = 1;
      rate2 = -1;
      hiddenRate1 = 0.75;
      hiddenRate2 = 1;
    }

    if (rank1 == -1 && rank2 == 1) {
      //No spouse and children
      rate1 = -1;
      rate2 = 1;
      hiddenRate1 = 1;
      hiddenRate2 = 0.5;
    }

    if (rank1 == -1 && rank2 == 2) {
      //No spouse and parents
      rate1 = -1;
      rate2 = 1;
      hiddenRate1 = 1;
      hiddenRate2 = 0.25;
    }

    if (rank1 == -1 && rank2 == 3) {
      //No spouse and third degree
      rate1 = -1;
      rate2 = 1;
      hiddenRate1 = 1;
      hiddenRate2 = -1;
    } else {
      print("Log: Uygun mirasçı bulunamadı");
    }
  }
}

