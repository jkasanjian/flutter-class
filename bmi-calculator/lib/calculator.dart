import 'dart:math';

class Calculator {
  final int height;
  final int weight;

  double _bmi; // adding _ makes it a private var

  Calculator({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Do some exercise';
    } else if (_bmi > 18.5) {
      return 'Nice';
    } else {
      return 'Eat some food';
    }
  }
}
