import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[50],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/unicorn.jpg'),
                radius: 70.0,
              ),
              Text(
                'Poh Wei Leong',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'STUDENT',
                style: TextStyle(
                  fontFamily: 'Source Sans Pro',
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text('software engineering, aspect-based software development'),
              SizedBox(
                height: 20,
                width: double.infinity,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.deepPurple,
                  ),
                  title: Text(
                    '+601111445088',
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 50.0),
                child: ListTile(
                  leading: Icon(
                    Icons.mail,
                    color: Colors.deepPurple,
                  ),
                  title: Text(
                    'b200166b@sc.edu.my',
                    style: TextStyle(color: Colors.deepPurpleAccent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
