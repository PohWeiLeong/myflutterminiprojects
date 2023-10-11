import 'package:bmi/components/bottom_button.dart';
import 'package:bmi/constants.dart';
import 'package:flutter/material.dart';
import '../components/reusable_card.dart';

class ResultPage extends StatelessWidget {
  final String bmiValue;
  final String bmiCategory;
  final String someWords;

  ResultPage({required this.bmiValue, required this.bmiCategory, required this.someWords});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(child: Text('YOUR RESULT', style: kTitleStyle)),
            Expanded(
              child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(bmiCategory),
                      Text(bmiValue, style: kNumberStyle),
                      Text(someWords),
                    ],
                  ),
                  cardColor: kActiveCardColor),
            ),
            BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              text: 'RE-CALCULATE',
            ),
          ],
        ),
      ),
    );
  }
}
