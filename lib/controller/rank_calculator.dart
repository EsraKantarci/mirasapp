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

  List<String> inheritorsNames = [];
  List<double> inheritorsRates = [];

  List<Map<int, int>> inheritors = [];
  List<Map<int, int>> deceaseds = [];
  List<Map<int, int>> grandchildren = [];

  List<int> deadList = [];

  // id and rate
  Map<int, double> rankRateMap = {-1: 1};

  Map<String, double> rateListResult = new Map();
  Map<String, double> hiddenRateListResult = new Map();

  double rates;
  int eligibleRank = 3;
  bool isSpouseAlive = false;

  Map<int, Person> peopleIterable;

  String calculateRates(List<Person> people) {
    deadList.removeRange(0, deadList.length);

    int parentId = 100;

    Map<int, int> mapped = new Map();
    Map<int, int> mappedDied = new Map();
    Map<int, int> mappedChildren = new Map();

    Map<int, List<int>> mappedPersonChildren = new Map();

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
    else{
      isSpouseAlive = false;
    }

    //besides spouse:
    for (int i = 1; i < len; i++) {
      person = peopleIterable[i];

      if (person.rank <= eligibleRank) {
        if (person.isAlive == 1 ||
            (person.isAlive == 0 && person.childCount > 0)) {
          eligibleRank = person.rank;
          if (person.parentId <= parentId) {
            parentId = person.parentId;
            mapped[person.id] = person.parentId;
            if (person.isAlive == 0) {
              print("ölü: " + person.toString());
              mappedDied[person.id] = person.parentId;
              mappedPersonChildren[person.id] = [];
            } else {
              print("geç, yaşıyo");
            }
          } else {
            if (peopleIterable[person.parentId - 1].isAlive == 0) {
              mappedChildren[person.id] = person.parentId;
              if (person.isAlive == 0 && person.childCount > 0) {
                mappedPersonChildren[person.id] = [];
              } else {
                continue;
              }
            } else {
              continue;
            }
          }
        } else {
          //keep checking, rank is not lower
          continue;
        }
      } else {
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

    print("mappedDied --> " + mappedDied.toString());
    print("mapped children aşağıdaki: ");
    print(mappedChildren.toString());
    for (int j in mappedPersonChildren.keys) {
      List<int> mappingList = [];
      for (int i in mappedChildren.keys) {
        if (mappedChildren[i] == j) {
          print("eşit çıktım, eklendim");
          mappingList.add(i);
        } else {
          print("geçtim");
          continue;
        }
      }
      mappedPersonChildren[j] = mappingList;
    }

    print("işte mappedPersonChildren" + mappedPersonChildren.toString());

    inheritors.add(mapped);
    deceaseds.add(mappedDied);
    grandchildren.add(mappedChildren);

    // TODO: recursion:
    /*
    Önce yapmak istediğim şeyi yazayım ki aklımda şematik olarak canlansın.

   inheritorları ekledik. her inheritor başına eşit pay düşecek.
   ama bu inheritorlar ölü olabilir.

   dolayısıyla ölü olanlar deceaseds içinde yer alıyor.

   bu ölü olanların çocukları var demek oluyor.
   mirasa hak kazanan tüm bir alt soylar grandchildren içerisinde yer alıyor.

   aynı parentId işlenmiş olanları (yani map'teki valueları) tek bir grup yapmalıyız.
   oradan gelen pay bilgisi ile recursive biçimde deadlar için aratmalıyız.

   yani deadlar yeni inheritor listimiz olacak. onu gönderip sonuç alıcaz.
   base case de deadlist.isempty ise

   hadi bunu düşüneyim.

     */
    //  getChildrenList(2, grandchildren, peopleIterable);

    var rateList = getRates(
        isSpouseAlive, inheritors, deceaseds, grandchildren, eligibleRank);

    if (spouse.isAlive == 1) {
      rateListResult[spouse.name] = rateList["rate1"];
      hiddenRateListResult[spouse.name] =
          rateList["rate1"] * rateList["hiddenRate1"];
    }


    GlobalState.instance.rates = rateList;

    //parent id -1 for the start, then it will return to a recursion

    mapRatesToPeople(-1, inheritors[0].keys.toList());

    print("Deadlist: " + deadList.toString());

    while (deadList.isNotEmpty) {
      parentId = deadList.first;
      deadList.remove(parentId);
      mapRatesToPeople(parentId, mappedPersonChildren[parentId]);
      print("Deadlist: " + deadList.toString());
    }

    print("VE ÖLÜLERİN RATELERİ:");
    print(rankRateMap.toString());
    print("VEEE SONUÇLAR:");
    print(rateListResult.toString());


    GlobalState.instance.rates = rateListResult;
    GlobalState.instance.hiddenRates = hiddenRateListResult;
    print("Saklı Paylar: " + hiddenRateListResult.toString());
    return rateList.toString();
  }

  // TODO:
  // Sorular:
  // 1- parent'ın payı ne? --> rankRateMap içinde yer alıyor
  // 2- çarpılacak oran ne? --> rate2 içinde yer alıyor --> bu ilk sefer için geçerli.
  // devamında çarpmıyoruz. sadece rootparent'ın ilk mirasçıları için çarpıcaz.
  // 3- kaç eşit paya bölünecek? --> listenin uzunluğuna bölünecek

  //rate1'i hesaplamaya gerek yok, spouse'un ya var ya yok.
  //parentId eğer -1 ise, pay: 1

  void mapRatesToPeople(int parentId, List<int> inheritorsList) {
    //şimdi bize ne geldi? parentID ve parent'ın çocuklarının listesi.
    //ayrıca ölüler de geldi çünkü neden? ölü çocukların paydaşı olabilir.
    //ama ben çok ikna değilim, bence bu deadsList'i çıkartalım,
    //zaten mappedPersonChildren içinde ölülerin çocukları eşlenecek.

    double parentRate = rankRateMap[parentId];
    int personCount = inheritorsList.length;

    for (int i in inheritorsList) {
      double rate;
      Person person = peopleIterable[i - 1];
      if (parentId == -1) {
        double rate2 = GlobalState.instance.rates["rate2"];

        rate = rate2 * (1 / personCount);

        if (person.isAlive == 1) {
          hiddenRateListResult[person.name] = rate*GlobalState.instance.rates["hiddenRate2"];
          rateListResult[person.name] = rate;
        } else {
          rankRateMap[person.id] = rate;
          deadList.add(person.id);
        }
      } else {
        rate = parentRate * (1 / personCount);
        if (person.isAlive == 1) {
          rateListResult[person.name] = rate;
          hiddenRateListResult[person.name] = rate*GlobalState.instance.rates["hiddenRate2"];
        } else {
          rankRateMap[person.id] = rate;
          deadList.add(person.id);
        }
      }
    }
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

  /* Map<String, List<int>> getChildrenList(int parentId,
      List<Map<int, int>> grandchildren, Map<int, Person> peopleIterable) {
    List<Person> childrenList = [];
    Map<String, List<int>> listData = new Map();
    List<int> deadKeyList = [];
    List<int> keyList = grandchildren[0].keys.toList();
    Map<int, int> grandchildrenIterable = grandchildren[0];
    print("keylist for children: " + keyList.toString());

    int childCount = 0;
    Map<int, int> childCountList = new Map();

    //for each eklemek lazım şuraya:

    for (int i in grandchildrenIterable.values) {}

    return listData;
  }*/

  List<String> getResult() {
    if (GlobalState.instance.answers.hasSpouse == 1) {
      inheritorsNames = rateListResult.keys.toList();
    }
    else{
      rateListResult.remove(GlobalState.instance.answers.spouseName);
      inheritorsNames = rateListResult.keys.toList();
    }
    print("Mirasçıların isimleri: " + inheritorsNames.toString());
    return inheritorsNames;
  }

  List<double> getInheritorsRates() {
    inheritorsRates = rateListResult.values.toList();
    print("Mirasçıların oranları: " + inheritorsRates.toString());
    return inheritorsRates;
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
