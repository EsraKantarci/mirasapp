
import 'package:miras/model/person.dart';


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


  for (int i in grandchildrenIterable.values) {
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

/*







Map<String, double> getRateMap(
    Map<int, Person> peopleIterable, double rate2, Map<int, int> inheritors, int parentId) {
  Map<String, double> result = new Map();

  Person person;

  print(rate2);

  print(deadList.toString());
  print(inheritors.toString());

  double rate = 1 / inheritors.length;

  for (int i in inheritors.keys) {
    person = peopleIterable[i - 1];
    parentId = person.parentId;
    print(parentId);
    double theRate = rankRateMap[parentId] * rate * rate2;

    if (person.isAlive == 0 && person.childCount > 0) {
      deadList.add(person.id);
      print(parentId);
      rankRateMap[person.id] = theRate;
      print(rankRateMap);
    }

    else {
      result[person.name] = theRate;
      print(result);
    }
  }
  List<int> valueList = grandchildren[0].values.toList();
  parentId = deadList.last;
  deadList.removeLast();
  print(parentId);

  return result;
}



 */
