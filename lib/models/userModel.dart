// import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ffi';

class User {
  final String userId;
  final String email;
  final String name;
  final String job;
  final String dob;
  final String avatar;
  final String phonenumber;
  final Array projectsList;

  User({
    required this.userId,
    required this.email,
    required this.name,
    required this.job,
    required this.dob,
    required this.avatar,
    required this.phonenumber,
    required this.projectsList,
  });

  factory User.fromDocument(Map<String, dynamic> doc) {
    return User(
      userId: doc['userId'],
      email: doc['email'],
      name: doc['name'],
      job: doc['job'],
      dob: doc['dob'],
      avatar: doc['avatar'],
      phonenumber: doc['phonenumber'],
      projectsList: doc['projectsList'],
    );
  }
}
