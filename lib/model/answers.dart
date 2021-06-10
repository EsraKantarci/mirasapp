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

  int childCount;

  //defaults:
  Answers(
      {this.name = "",
      this.spouseName = "",
      this.motherName = "",
      this.fatherName = "",
      this.childCount = -1,
      this.hasSpouse = -1,
      this.hasChild = -1,
      this.hasParent = -1,
      this.hasSecondRank = -1,
      this.hasGrandparent = -1,
      this.hasThirdRank,
        this.answers, });

  //in order to show inside app
  @override
  String toString() {
    return 'Answers{name: $name, answers: $answers, hasSpouse: $hasSpouse, hasChild: $hasChild, childCount = $childCount, hasParent: $hasParent, hasGrandparent: $hasGrandparent, spouseName: $spouseName, motherName: $motherName, fatherName: $fatherName}';
  }
}
