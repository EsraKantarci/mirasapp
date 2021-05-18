class Answers {
  String name;
  List<String> answers;

  //rank checks:
  int hasSpouse;
  int hasChild;
  int hasParent;
  int hasGrandparent;

  //defaults:
  Answers(
      {this.name = "",
      this.answers, //cannot be blank
      this.hasSpouse = -1,
      this.hasChild = -1,
      this.hasParent = -1,
      this.hasGrandparent = -1});
}
