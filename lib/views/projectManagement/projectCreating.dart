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

class projectCreatingScreen extends StatefulWidget {
  String uid;

  projectCreatingScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _projectCreatingScreenState createState() => _projectCreatingScreenState(uid);
}

class _projectCreatingScreenState extends State<projectCreatingScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  _projectCreatingScreenState(uid);

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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundBasic), fit: BoxFit.cover),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 62),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      padding: EdgeInsets.only(left: 28),
                      onPressed: () {
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                projectManagementScreen(required, uid: uid),
                          ),
                        );
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 28, color: black),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.only(right: 28),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => projectManagementScreen(required, uid: uid),
                              ),
                            );
                          },
                          child: Text(
                            "Done",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: purpleDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 18
                            ),
                          )
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
