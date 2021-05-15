class Rank {
  int rank;
  String relativeName;
  double rate;
  double hiddenRate;

  Rank(
      {this.rank = -1,
      this.relativeName = '',
      this.rate = 1,
      this.hiddenRate = 1});

}
enum Ranks{SPOUSE, CHILD, PARENT, GRANDPARENT, NONE}



