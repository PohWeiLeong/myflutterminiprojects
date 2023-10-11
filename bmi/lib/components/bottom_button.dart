import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final void Function() onTap;
  final String text;

  BottomButton({required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Color(0xFFEB1555),
      //TODO: 14. Create a BMI Calculator class to calculate BMI value, display BMI category and display some words of encouragement
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}