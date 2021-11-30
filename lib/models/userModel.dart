// import firebase
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String? email;
  // final String profileName;
  // final String username;
  // final String url;
  // final String bio;

  User(this.uid, this.email);

  // User({
  //   required this.uid,
  //   required this.email,
  //   // required this.profileName,
  //   // required this.username,
  //   // required this.url,
  //   // required this.bio,
  // });

  // factory User.fromDocument(DocumentSnapshot doc) {
  //   return User(
  //     id: doc.documentID,
  //     email: doc['email'],
  //     username: doc['username'],
  //     url: doc['url'],
  //     profileName: doc['profileName'],
  //     bio: doc['bio'],
  //   );
  // }
}
