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
  List<Map<int, int>> grandchildren = [];
  double rates;
  int eligibleRank = 3;
  bool isSpouseAlive = false;

  Map<int, Person> peopleIterable;

  String calculateRates(List<Person> people) {
    Map<int, int> mapped = new Map();
    Map<int, int> mappedDied = new Map();
    Map<int, int> mappedChildren = new Map();

    inheritors.removeRange(0, inheritors.length);
    deceaseds.removeRange(0, deceaseds.length);
    grandchildren.removeRange(0, deceaseds.length);

    peopleIterable = people.asMap();
    int len = peopleIterable.length;
    Person person;

    //spouse:
    Person spouse = peopleIterable[0];
    //we need to add spouse in any case. Rates will change.
    if (spouse.isAlive == 1) {
      isSpouseAlive = true;
    }

    //besides spouse:
    for (int i = 1; i < len; i++) {
      person = peopleIterable[i];

      if (person.isAlive == 1) {
        if (person.rank <= eligibleRank) {
          eligibleRank = person.rank;
          mapped[person.id] = person.parentId;
        }

        else {
          //keep checking
          continue;
        }
      } else {
        if (person.rank <= eligibleRank && person.childCount>0) {
          print(person.toString());
          //person is dead. let's check the other ranks and
          // add the person into deceseads so we can check children then
          //and also we add it to inheritors list so we can save his/her share
          mapped[person.id] = person.parentId;
          mappedDied[person.id] = person.parentId;
        } else {
          continue;
        }
      }
    }

    List keyList = mappedDied.keys.toList();
    var list = [];

    for (int i = 0; i < keyList.length; i++) {
      //key is also id and index of people list
      int key = keyList[i];
      print("key is: " + key.toString());
      print("parentID: " + mappedDied[key].toString());
      //key-1 because indexing starts from 0
      Person person = peopleIterable[key - 1];

      if (person.childCount > 0) {
        //şimdi parent id'si keyle eşlenenlere bakmamız lazım.
        var matchingParentId = key;
        print("matchingParentId:" + matchingParentId.toString());

        list.add(people.where((item) =>
            matchingParentId.toString().contains(item.parentId.toString())));
        print(list.toString());

        for (int j = 0; j < list.length; j++) {
          mappedChildren[person.id] = person.parentId;
        }
      } else {
        continue;
      }
    }
    inheritors.add(mapped);
    deceaseds.add(mappedDied);
    grandchildren.add(mappedChildren);

    var rateList = getRates(
        isSpouseAlive, inheritors, deceaseds, grandchildren, eligibleRank);

    return rateList.toString();
  }

  Map<String, double> getRates(
      bool isSpouseAlive,
      List<Map<int, int>> inheritors,
      List<Map<int, int>> deceaseds,
      List<Map<int, int>> grandchildren,
      int eligibleRank) {

    var inheritorsIterable = inheritors[0];
    var deceasedsIterable = deceaseds[0];
    var grandchildrenIterable = grandchildren[0];

    int lenInheritors = inheritorsIterable.length;
    int lenDeads = deceasedsIterable.length;
    int lenGrandchildren = grandchildrenIterable.length;


    print("Inheritors " + inheritorsIterable.toString());
    print("Ölüler " + deceasedsIterable.toString());
    print("Bebeler " + grandchildrenIterable.toString());

    //spouse rank is 0
    int rank1 = 0;
    if (!isSpouseAlive) {
      rank1 = -1;
    }
    int rank2 = eligibleRank;
    var rateList = rateOperator(rank1, rank2);

    var rate2 = rateList["rate2"];
    var hiddenRate2 = rateList["hiddenRate2"];

    int count = lenInheritors;

    while(count>0){
      count--;
    }
    return rateList;
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

  Map<String, double> rateOperator(int rank1, int rank2) {
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
    double rate1;
    double rate2;
    double hiddenRate1;
    double hiddenRate2;

    Map<String, double> rates = new Map();
    print("rank1: " + rank1.toString());
    print("rank2: " + rank2.toString());

    if (rank1 == 0 && rank2 == 1) {
      //Spouse and children
      rates["rate1"] = 0.25;
      rates["rate2"] = 0.75;
      rates["hiddenRate1"] = 1;
      rates["hiddenRate2"] = 0.5;
    } else if (rank1 == 0 && rank2 == 2) {
      //Spouse and parent
      rates["rate1"] = 0.5;
      rates["rate2"] = 0.5;
      rates["hiddenRate1"] = 1;
      rates["hiddenRate2"] = 0.25;
    } else if (rank1 == 0 && rank2 == 3) {
      //Spouse and third degree
      rates["rate1"] = 0.75;
      rates["rate2"] = 0.25;
      rates["hiddenRate1"] = 0.75;
      rates["hiddenRate2"] = -1;
    } else if (rank1 == 1 && rank2 == -1) {
      //Only spouse
      rates["rate1"] = 1;
      rates["rate2"] = -1;
      rates["hiddenRate1"] = 0.75;
      rates["hiddenRate2"] = 1;
    } else if (rank1 == -1 && rank2 == 1) {
      //No spouse and children
      rates["rate1"] = -1;
      rates["rate2"] = 1;
      rates["hiddenRate1"] = 1;
      rates["hiddenRate2"] = 0.5;
    } else if (rank1 == -1 && rank2 == 2) {
      //No spouse and parents
      rates["rate1"] = -1;
      rates["rate2"] = 1;
      rates["hiddenRate1"] = 1;
      rates["hiddenRate2"] = 0.25;
    } else if (rank1 == -1 && rank2 == 3) {
      //No spouse and third degree
      rates["rate1"] = -1;
      rates["rate2"] = 1;
      rates["hiddenRate1"] = 1;
      rates["hiddenRate2"] = -1;
    } else {
      // rates will return null
      print("Log: Uygun mirasçı bulunamadı");
    }

    print(rates);
    return rates;
  }
}
