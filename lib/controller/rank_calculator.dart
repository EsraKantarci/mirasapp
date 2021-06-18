import 'dart:collection';
import 'dart:math';
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

    int parentId = 100;

    Map<int, int> mapped = new Map();
    Map<int, int> mappedDied = new Map();
    Map<int, int> mappedChildren = new Map();

    Map <int, List<int> > mappedPersonChildren = new Map();

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


      if(person.rank <= eligibleRank){
        if(person.isAlive==1 || (person.isAlive == 0 && person.childCount > 0)){
          eligibleRank = person.rank;
          if(person.parentId <= parentId){
          parentId = person.parentId;
          mapped[person.id] = person.parentId;
          if(person.isAlive == 0){
            print("ölü: " + person.toString());
            mappedDied[person.id] = person.parentId;
          }
          else{
            print("geç, yaşıyo");
          }
          }
          else{
            if(peopleIterable[person.parentId - 1].isAlive == 0) {
              mappedChildren[person.id] = person.parentId;
            }
            else{
              continue;
            }
          }
        }

        else {
          //keep checking, rank is not lower
          continue;
        }
      }

      else {
          continue;

      }
    }

    // ölenler için:

    List keyList = mappedDied.keys.toList();
    List<int> list = [];
    print("keylist: " + keyList.toString());

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

      } else {
        continue;
      }
    }

    inheritors.add(mapped);
    deceaseds.add(mappedDied);
    grandchildren.add(mappedChildren);

    // TODO: recursion:
    getChildrenList(2, grandchildren, peopleIterable);

    var rateList = getRates(
        isSpouseAlive, inheritors, deceaseds, grandchildren, eligibleRank);

    return rateList.toString();
  }

  // TODO:
  // Sorular:
  // 1- parent'ın payı ne?
  // 2-çarpılacak oran ne?
  // 3- kaç eşit paya bölünecek?

  //rate1'i hesaplamaya gerek yok, spouse'un ya var ya yok.
  //parentId eğer -1 ise, pay: 1
  Map<int, double> getRateMap(double rate2, Map<int, Person> peopleIterable) {


  }


  List getDataParameters(List dataList, int numberOfFields) {
    var result = [];
    int i = 0;
    while(dataList.length > i) {
      result.add(dataList.sublist(i, min(i + numberOfFields, dataList.length)));
      i += numberOfFields;
    }
    return result;
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

    return rateList;
  }

  Map<String, List<int>> getChildrenList(int parentId,  List<Map<int, int>> grandchildren, Map<int, Person> peopleIterable){
    List<Person> childrenList = [];
    Map<String, List<int>> listData = new Map();
    List<int> deadKeyList = [];
    List<int> keyList = grandchildren[0].keys.toList();
    Map<int, int> grandchildrenIterable = grandchildren[0];
    print("keylist for children: " + keyList.toString());

    int childCount = 0;
    Map<int, int> childCountList = new Map();

    //for each eklemek lazım şuraya:


    for (int i in grandchildrenIterable.keys) {
        print("g i:" + i.toString());
        if (parentId == grandchildrenIterable[i]) {
          if (peopleIterable[i - 1].isAlive == 0 && peopleIterable[i-1].childCount>0) {
            deadKeyList.add(peopleIterable[i - 1].id);
            print("i: " + i.toString());
            keyList.remove(i);
            print("keylist after removal:" + keyList.toString());
            childCount++;
          }
          else {
            childCount++;
            childrenList.add(peopleIterable[i - 1]);
            print("çocuk eklendi: " + childrenList.toString());
            keyList.remove(i);
            print("çocuk eklendi removalı: " + keyList.toString());
          }
        }
        else {
          continue;
        }

        print("Deadkey list: " + deadKeyList.toString());
        print("keyList list: " + keyList.toString());
      }

    childCountList[parentId] = childCount;
    print("child count list: " + childCountList.toString());

    print("bitti");
    print(childrenList.toString());


    return listData;
  }



  String getResult() {
    if (GlobalState.instance.answers.hasSpouse == 1) {
      result = "Evli,";
    }
  }

  String getInterpretation() {
    return "";
  }

  Map<String, double> rateOperator(int rank1, int rank2) {

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
