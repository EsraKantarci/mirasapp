import 'package:miras/model/parent.dart';

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

/*
Rank = 0: Spouse
Rank = 1: Descendent
Rank = 2: Parent
Rank = 3: Grandparent
Rank = -1: NONE
 */


