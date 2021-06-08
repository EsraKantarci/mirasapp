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


  Person(
      {this.name = "",
        this.id = -1,
        this.parentId = -1,
        this.isAlive = true,
        this.hasParent = false,
        this.hasChild = false});
}
