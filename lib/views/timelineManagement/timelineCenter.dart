import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';

class timelineCenterScreen extends StatefulWidget {
  String uid;

  timelineCenterScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _timelineCenterScreenState createState() => _timelineCenterScreenState(uid);
}

class _timelineCenterScreenState extends State<timelineCenterScreen> {
  // final String? uid = controllers.currentUserId;

  String? uid = "";

  _timelineCenterScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid;
    print('The current uid is $uid');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
        child: Text(
          "Timeline Center Screen",
          style: TextStyle(
            fontFamily: 'SFProText',
            fontWeight: FontWeight.w700,
            color: Colors.blueAccent,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
