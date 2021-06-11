import 'dart:math';
import 'global_state.dart';

class Calculator {
  Calculator({this.answers});

  final List<String> answers;
  String result = "";

  double _bmi;

  String calculateBMI() {
    //_bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (GlobalState.instance.answers.hasSpouse == 1){
      result = "Evli,";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}