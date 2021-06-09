class Person {
  String childName;
  String parentName;
  int parentId;
  int id;
  bool isAlive;
  bool hasChild;

  Person(
      {this.childName = "",
      this.parentName = "",
      this.parentId = -1,
      this.id = -1,
      this.isAlive = true,
      this.hasChild = false});
}
