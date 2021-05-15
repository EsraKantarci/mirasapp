RateOperator(int rank1, int rank2, double rate1, double rate2,
    double hiddenRate1, double hiddenRate2) {
  if (rank1 == 0 && rank2 == 1) {
    //Spouse and children
    rate1 = 0.25;
    rate2 = 0.75;
    hiddenRate1 = 1;
    hiddenRate2 = 0.5;
  }

  if (rank1 == 0 && rank2 == 2) {
    //Spouse and parent
    rate1 = 0.5;
    rate2 = 0.5;
    hiddenRate1 = 1;
    hiddenRate2 = 0.25;
  }
  if (rank1 == 0 && rank2 == 3) {
    //Spouse and third degree
    rate1 = 0.75;
    rate2 = 0.25;
    hiddenRate1 = 0.75;
    hiddenRate2 = 0;
  }

  if (rank1 == 1 && rank2 == -1) {
    //Only spouse
    rate1 = 1;
    rate2 = 0;
    hiddenRate1 = 0.75;
    hiddenRate2 = 1;
  }

  if (rank1 == -1 && rank2 == 1) {
    //No spouse and children
    rate1 = 0;
    rate2 = 1;
    hiddenRate1 = 1;
    hiddenRate2 = 0.5;
  }

  if (rank1 == -1 && rank2 == 2) {
    //No spouse and parents
    rate1 = 0;
    rate2 = 1;
    hiddenRate1 = 1;
    hiddenRate2 = 0.25;
  }

  if (rank1 == -1 && rank2 == 3) {
    //No spouse and third degree
    rate1 = 0;
    rate2 = 1;
    hiddenRate1 = 1;
    hiddenRate2 = 0;
  } else {
    print("Log: Uygun mirasçı bulunamadı");
  }
}
