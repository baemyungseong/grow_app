// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// //import constants
// import 'package:grow_app/constants/colors.dart';
// import 'package:grow_app/constants/fonts.dart';
// import 'package:grow_app/constants/images.dart';
// import 'package:grow_app/constants/icons.dart';
// import 'package:grow_app/constants/others.dart';

// //import firebase
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// //import others
// import 'dart:async';

// FirebaseAuth auth = FirebaseAuth.instance;
// User? user = FirebaseAuth.instance.currentUser;
// final userid = user?.uid.toString();
// String? uid = userid;

// // var collection = FirebaseFirestore.instance.collection('projects');

// // class projectStream {
// //   var counter = 0;
// //   StreamController streamcontroller = new StreamController();
// //   Stream get stream => streamcontroller.stream;

// //   void increment() {
// //     counter += 1;
// //     streamcontroller.sink.add(counter);
// //   }

// //   void dispose() {
// //     streamcontroller.close();
// //   }

// //   void exportProjects() async {
// //     var a;
// //     var querySnapshot = await collection.get();
// //     for (var queryDocumentSnapshot in querySnapshot.docs) {
// //       Map<String, dynamic> result = queryDocumentSnapshot.data();
// //       var name = result['name'];
// //       var phone = result['phone'];
// //       streamcontroller.add(result);
// //       a = result;
// //     }
// //     print(a);
// //   }
// // }

// var taskcollections = FirebaseFirestore.instance.collection('users').doc(uid).collection('projects');
// // .orderBy('time')
// List<Map<String, dynamic>> result = [];

// class projectStream {
//   int counter = 0;
//   StreamController streamcontroller = new StreamController();
//   Stream get stream => streamcontroller.stream;

//   void increment() {
//     counter += 1;
//     streamcontroller.sink.add(counter);
//   }

//   void dispose() {
//     streamcontroller.close();
//   }

//   void exportProjects() async {
//     QuerySnapshot querySnapshot = await taskcollections.get();
//     for (int i = 0; i < querySnapshot.docs.length; i++) {
//       result.add(querySnapshot.docs[i].data() as Map<String, dynamic>);
//       streamcontroller.sink.add(result);
//       // result = querySnapshot.docs;
//     }
//     print(streamcontroller);
//     // streamcontroller.add(result);
//   }
// }
