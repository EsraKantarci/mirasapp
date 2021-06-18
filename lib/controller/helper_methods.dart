
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

