import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class User with ChangeNotifier {
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
