class Answers {
  String name;
  List<String> answers;

  //rank checks:
  int hasSpouse;
  int hasChild;
  int hasParent;
  int hasSecondRank;
  int hasGrandparent;
  int hasThirdRank;

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
      this.hasSecondRank = -1,
      this.hasGrandparent = -1,
      this.hasThirdRank});

  //in order to show inside app
  @override
  String toString() {
    return 'Answers{name: $name, answers: $answers, hasSpouse: $hasSpouse, hasChild: $hasChild, hasParent: $hasParent, hasGrandparent: $hasGrandparent, spouseName: $spouseName, motherName: $motherName, fatherName: $fatherName}';
  }
}
