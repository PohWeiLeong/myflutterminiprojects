import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BallPage(),
      ),
    );

// BallPage StatelessWidget having Scaffold with AppBar and Ball
class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Ball(),
      backgroundColor: Color.fromARGB(255, 70, 171, 254),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 140, 0, 247),
        centerTitle: true,
        title: const Text(
          'Ask Me Anything',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Ball StatefulWidget having Container as body for Scaffold body in BallPage
class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  // integer to hold ballNumber
  int ballNumber = 0;

  // randomize ballNumber
  void randomize() {
    setState(() {
      ballNumber = Random().nextInt(5);
    });
    // print ballNumber when click
    print('Your Ball Number is ${ballNumber + 1}');
  }

  @override
  Widget build(BuildContext context) {
    // centralize
    return Center(
      // image clickable
      child: GestureDetector(
        onTap: () => randomize(),
        // display image
        child: Image.asset('assets/ball${ballNumber + 1}.png'),
      ),
    );
  }
}
