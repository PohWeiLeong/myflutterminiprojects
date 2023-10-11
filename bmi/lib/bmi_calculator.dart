import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;
  double? bmi;

  BMICalculator({required this.height, required this.weight});

  String calcBMI() {
    bmi = weight / pow(height/100, 2);
    return bmi!.toStringAsFixed(1);
  }

  String displayBMICategory() {
    String category;

    if(bmi! < 18.5)
      category = 'Underweight';
    else if(bmi! >= 18.5 && bmi! < 25)
      category = 'Healthy Weight';
    else if(bmi! >= 25 && bmi! < 30)
      category = 'Overweight';
    else
      category = 'Obesity';

    return category;
  }

  String displaySomeWords() {
    String someWords;

    if(bmi! < 18.5)
      someWords = 'Oh no! You need to eat more';
    else if(bmi! >= 18.5 && bmi! < 25)
      someWords = 'Good, you\'re healthy. Keep it up';
    else if(bmi! >= 25 && bmi! < 30)
      someWords = 'Oh no! Please have a balanced diet';
    else
      someWords = 'Oh no! Please have a balanced diet and work out more';

    return someWords;
  }
}