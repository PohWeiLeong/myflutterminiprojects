import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Center(
            child: Text('I Am Rich'),
          ), 
        ),
        body: Center(
          child: Image.asset
           ('images/diamond.jpg'), 
        ),
      ),
    );
  }
} 
