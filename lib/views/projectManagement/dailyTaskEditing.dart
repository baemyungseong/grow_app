import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import views
import 'package:grow_app/views/projectManagement/projectManagement.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';

class dailyTaskEditingScreen extends StatefulWidget {
  String uid;

 dailyTaskEditingScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
   dailyTaskEditingScreenState createState() =>  dailyTaskEditingScreenState(uid);
}

class  dailyTaskEditingScreenState extends State<dailyTaskEditingScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

   dailyTaskEditingScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: white,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Daily Task Editing Screen",
            style: TextStyle(
              fontFamily: 'SFProText',
              fontWeight: FontWeight.w700,
              color: Colors.blueAccent,
              fontSize: 20,
            ),
          ),
          GestureDetector(
            //action navigate to signin screen
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      projectManagementScreen(required, uid: uid),
                ),
              );
            },
            child: AnimatedContainer(
              alignment: Alignment.center,
              duration: Duration(milliseconds: 300),
              height: 54,
              width: 260,
              decoration: BoxDecoration(
                color: purpleDark,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: white.withOpacity(0.1),
                    spreadRadius: 0,
                    blurRadius: 64,
                    offset: Offset(15, 15), // changes position of shadow
                  ),
                  BoxShadow(
                    color: white.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 20,
                    offset: Offset(8, 8), // changes position of shadow
                  ),
                ],
              ),
              child: Text(
                "Close",
                style: TextStyle(
                    color: white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: textButton),
              ),
            ),
          )
        ],
      )),
    );
  }
}
