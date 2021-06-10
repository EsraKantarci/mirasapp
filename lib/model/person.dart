class Person {

  int id;
  String name;
  int isAlive;
  int hasParent;
  int hasChild;
  int parentId;
  int rank; // spouse: 0, descendent:1, parent/second: 2, gparent/third:3
  int childCount;

  Person(
  {this.name = "",
  this.id = -1,
  this.parentId = -1,
  this.isAlive = -1,
  this.rank = -1,
  this.hasParent = -1,
  this.hasChild = -1,
  this.childCount = -1,
  });
  }

