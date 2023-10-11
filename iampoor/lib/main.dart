import 'package:flutter/material.dart';

void main() {
  runApp(PoorApp());
}

class PoorApp extends StatelessWidget {
  const PoorApp({Key? key}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text('I Am Poor'),
          ),
        ),
        body: Center(
          child: Image.asset
           ('images/coal.jpg'), 
        ),
      ),
    );
  }
} 