import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Center(child: Text('Dice')),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDice = 1;
  int rightDice = 2;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              // Left Dice
              child: TextButton(
                onPressed: () {
                  setState(() {
                    randomize();
                  });
                  print('Left dice is pressed');
                },
                child: Image.asset(
                  'images/dice$leftDice.png',
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              // Right Dice
              child: TextButton(
                onPressed: () {
                  setState(() {
                    randomize();
                  });
                  print('Right dice is pressed');
                },
                child: Image.asset(
                  'images/dice$rightDice.png',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void randomize() {
    rightDice = Random().nextInt(6) + 1;
    leftDice = Random().nextInt(6) + 1;
  }
}


