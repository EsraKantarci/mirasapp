// Child'ı bu şekilde revize edebiliriz.
// Aslında grandparentlar için oluşturdum
// Yine de alt alta çocuk eklemek için de kullanabiliriz.
// parent id'den bağlarız. daha mantıklı.

class Person {
  int id;
  String name;
  bool isAlive;
  bool hasParent;
  bool hasChild;
  int parentId;
  int rank; // spouse: 0, descendent:1, parent/second: 2, gparent/third:3
  int childCount;
  double rate;

  Person(
      {this.name = "",
        this.id = -1,
        this.parentId = -1,
        this.isAlive = true,
        this.rank = -1,
        this.hasParent = false,
        this.hasChild = false,
        this.childCount = -1,
        this. rate = -1
      });
}
