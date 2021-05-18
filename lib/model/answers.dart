class Answers {
  String name;
  List<String> answers;

  //rank checks:
  int hasSpouse;
  int hasChild;
  int hasParent;
  int hasGrandparent;

  //only one names:
  String spouseName;
  String motherName;
  String fatherName;

  //defaults:
  Answers(
      {this.name = "",
      this.spouseName = "",
      this.motherName = "",
      this.fatherName = "",
      this.answers, //cannot be blank
      this.hasSpouse = -1,
      this.hasChild = -1,
      this.hasParent = -1,
      this.hasGrandparent = -1});
}