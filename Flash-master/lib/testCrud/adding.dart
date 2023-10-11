import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash/constants.dart';

import '../home.dart';

class Adding extends StatefulWidget {
  static String id = 'adding';

  const Adding({super.key});

  @override
  State<Adding> createState() => _AddingState();
}

class User {
  String id;
  final String name;
  final int age;

  User({
    this.id = '',
    required this.name,
    required this.age,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        age: json['age'],
      );
}

Future createUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();

  user.id = docUser.id;

  final json = user.toJson();
  await docUser.set(json);
}

Stream<List<User>> readUsers() =>
    FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

class _AddingState extends State<Adding> with SingleTickerProviderStateMixin {
  final namecontroller = TextEditingController();
  final agecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("add"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          TextField(
            controller: namecontroller,
            decoration: kTextInputFieldDecoration.copyWith(hintText: 'name'),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: agecontroller,
            keyboardType: TextInputType.number,
            decoration: kTextInputFieldDecoration.copyWith(hintText: 'age'),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            child: const Text(
              'create',
            ),
            onPressed: () {
              final user = User(
                name: namecontroller.text,
                age: int.parse(agecontroller.text),
              );
              createUser(user);
              Navigator.pop(context);
              Navigator.pushNamed(context, Home.id);
            },
          ),
        ],
      ),
    );
  }
}
