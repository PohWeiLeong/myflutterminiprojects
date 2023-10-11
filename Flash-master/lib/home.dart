import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/testCrud/adding.dart';
import 'package:flutter/material.dart';
import 'package:flash/screens/chat_screen.dart';
import 'package:flash/components/rounded_button.dart';
import 'components/rounded_button.dart';
import 'constants.dart';

class Home extends StatefulWidget {
  static String id = 'home';

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.amber,
          ),
        ),
        leading: null,
        actions: [
          IconButton(
            onPressed: () {
              //Sign Out
              _auth.signOut();

              //Pop back to previous screen
              Navigator.pop(context);
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RoundedButton(
                color: Colors.lightBlueAccent,
                //Sign In with Email and Password, then if successful, navigate to the ChatScreen
                onPressed: () {
                  Navigator.pushNamed(context, ChatScreen.id);
                },
                label: 'chat',
              ),
              RoundedButton(
                color: Colors.lightBlueAccent,
                //Sign In with Email and Password, then if successful, navigate to the ChatScreen
                onPressed: () {
                  Navigator.pushNamed(context, Adding.id);
                },
                label: 'add',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
