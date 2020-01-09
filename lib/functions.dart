import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;
  final int age;
  final int workout;
  final String selectedGender;

  double _bmi;
  double _bmr;
  double _water;
  double _ideal;
  double _bodyFat;

  CalculatorBrain(
      {this.height, this.weight, this.age, this.selectedGender, this.workout});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResultBMI() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more!';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You should eat more!';
    }
  }

  String calculateBMR() {
    if (selectedGender == "selectedGender.Male")
      _bmr = 10 * weight + 6.25 * height - 5 * age + 5;
    else
      _bmr = 10 * weight + 6.25 * height - 5 * age - 161;
    return _bmr.toStringAsFixed(1);
  }

  String calculateWaterIntake() {
    _water = ((weight * 2.205 * 2 / 3) + (workout / 30 * 12)) * 0.0295735;
    return _water.toStringAsFixed(1);
  }

  String calculateIdealWeight() {
    if (selectedGender == "selectedGender.Male")
      _ideal = 48 + 1.1 * (height - 152);
    else
      _ideal = 45.4 + 0.9 * (height - 152);
    return _ideal.toStringAsFixed(0);
  }

  String getResultIdealWeight() {
    if (_ideal.ceil() > weight) {
      return 'You are ${_ideal.ceil() - weight} Underweight than your actual weight.';
    } else if (_ideal.ceil() == weight) {
      return 'You have ideal weight.';
    } else {
      return 'You are ${weight - _ideal.ceil()} Overweight than your actual weight.';
    }
  }

  String calculateBodyFat() {
    calculateBMI();
    if (selectedGender == "selectedGender.Male")
      _bodyFat = (1.20 * _bmi) + (0.23 * age) - 16.2;
    else
      _bodyFat = (1.20 + _bmi) + (0.23 * age) - 5.4;
    return _bodyFat.toStringAsFixed(1);
  }
}
