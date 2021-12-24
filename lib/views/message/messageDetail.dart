import 'dart:io';

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
import 'package:grow_app/views/profile/notificationCenter.dart';
import 'package:grow_app/views/profile/profileCenter.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class messageDetailScreen extends StatefulWidget {
  String uid;
  String uid2;

  messageDetailScreen(Required required,
      {Key? key, required this.uid, required this.uid2})
      : super(key: key);

  @override
  _messageDetailScreenState createState() =>
      _messageDetailScreenState(uid, uid2);
}

class _messageDetailScreenState extends State<messageDetailScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";
  String uid2 = '';

  _messageDetailScreenState(uid, this.uid2);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;

  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> messageFormKey = GlobalKey<FormState>();
  String message = '';
  void sendMessage(String uid, String message) async {
    FirebaseFirestore.instance
        .collection('chats/$uid/messages')
        .add({"userId": uid, 'message': message, 'createAt': DateTime.now()});
  }

  Future getMessage() async {
    FirebaseFirestore.instance
        .collection('chats/$uid/messages')
        .orderBy('createAt', descending: true);
  }

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
            decoration: BoxDecoration(color: purpleLight),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
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
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios, size: 28, color: black),
                    ),
                    Spacer(),
                    Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         Screen(required, uid: uid),
                            //   ),
                            // );
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: purpleDark,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 64,
                                  offset: Offset(8, 8),
                                ),
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                child:
                                    Icon(Iconsax.call, size: 18, color: white)),
                          ),
                        )),
                    SizedBox(width: 8),
                    Container(
                        padding: EdgeInsets.only(right: 28),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         Screen(required, uid: uid),
                            //   ),
                            // );
                          },
                          child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: purpleMain,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 64,
                                  offset: Offset(8, 8),
                                ),
                                BoxShadow(
                                  color: black.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Container(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                child: Icon(Iconsax.video,
                                    size: 18, color: white)),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.only(left: 28),
                  child: Text(
                    "Bang Pro Best",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24.0,
                        color: black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  height: 640,
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36.0),
                        topRight: Radius.circular(36.0),
                      )),
                  child: Container(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 518,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SizedBox(height: 32),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          width: 32,
                                          height: 32,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    // '${projects[index]!["background"]}'),
                                                    'https://i.imgur.com/FpZ9xFI.jpg'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 54,
                                          width: 172,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomRight:
                                                    Radius.circular(24.0)),
                                            color: whiteLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Hey there! What's up?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "18:28",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          width: 32,
                                          height: 32,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    // '${projects[index]!["background"]}'),
                                                    'https://i.imgur.com/FpZ9xFI.jpg'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 54,
                                          width: 172,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomRight:
                                                    Radius.circular(24.0)),
                                            color: whiteLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Hey there! What's up?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "18:31",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          width: 32,
                                          height: 32,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    // '${projects[index]!["background"]}'),
                                                    'https://i.imgur.com/FpZ9xFI.jpg'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 54,
                                          width: 172,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomRight:
                                                    Radius.circular(24.0)),
                                            color: whiteLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Hey there! What's up?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "18:32",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        Text(
                                          "18:32",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 87,
                                          width: 236,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomLeft:
                                                    Radius.circular(24.0)),
                                            color: purpleLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Nothing. Just chilling and watching" +
                                                  "\n" +
                                                  "some film on Youtube. What about" +
                                                  "\n" +
                                                  "you?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 40),
                                        Container(
                                          height: 54,
                                          width: 172,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(24.0)),
                                            color: whiteLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Jztr khum understand?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "18:33",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          width: 32,
                                          height: 32,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    // '${projects[index]!["background"]}'),
                                                    'https://i.imgur.com/FpZ9xFI.jpg'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 54,
                                          width: 172,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomRight:
                                                    Radius.circular(24.0)),
                                            color: whiteLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Jztr khum understand?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Text(
                                          "18:33",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      children: [
                                        Text(
                                          "18:35",
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 12.0,
                                              color: greyDark,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Spacer(),
                                        Container(
                                          height: 87,
                                          width: 236,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomLeft:
                                                    Radius.circular(24.0)),
                                            color: purpleLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Yeah I know. I’m in the same with" +
                                                  "\n" +
                                                  "position",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 16),
                                  Container(
                                    padding:
                                        EdgeInsets.only(left: 28, right: 28),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.bottomCenter,
                                          width: 32,
                                          height: 32,
                                          decoration: new BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    // '${projects[index]!["background"]}'),
                                                    'https://i.imgur.com/FpZ9xFI.jpg'),
                                                fit: BoxFit.cover),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        SizedBox(width: 8),
                                        Container(
                                          height: 87,
                                          width: 236,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(24.0),
                                                topRight: Radius.circular(24.0),
                                                bottomRight:
                                                    Radius.circular(24.0)),
                                            color: whiteLight,
                                          ),
                                          child: Container(
                                            // padding: EdgeInsets.only(left: 16),
                                            alignment: Alignment.center,
                                            child: Text(
                                              "Nothing. Just chilling and watching" +
                                                  "\n" +
                                                  "some film on Youtube. What about" +
                                                  "\n" +
                                                  "you?",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                            alignment: Alignment.center,
                                            child: Text(
                                              "18:33",
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400),
                                            ))
                                      ],
                                    ),
                                  ),
                                ])),
                      ),
                      Spacer(),
                      Container(
                        height: 54,
                        width: 319,
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 28, right: 28),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                          color: purpleLight,
                        ),
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 28),
                            Expanded(
                                child: Form(
                              key: messageFormKey,
                              child: TextField(
                                  controller: messageController,
                                  onChanged: (value) => setState(() {
                                        message = value;
                                      }),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: content14,
                                      color: greyDark,
                                    ),
                                    hintText: "Type your message...",
                                  )),
                            )),
                            SizedBox(width: 20),
                            Container(
                                padding: EdgeInsets.only(right: 28),
                                alignment: Alignment.center,
                                child: GestureDetector(
                                  onTap: () {
                                    // print(message + "hihiha");
                                    // message.trim().isEmpty
                                    //     ? null
                                    //     : sendMessage(uid, message);
                                    // sendMessage(uid, message);
                                  },
                                  child: AnimatedContainer(
                                    alignment: Alignment.center,
                                    duration: Duration(milliseconds: 300),
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: purpleMain,
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: [
                                        BoxShadow(
                                          color: black.withOpacity(0.25),
                                          spreadRadius: 0,
                                          blurRadius: 64,
                                          offset: Offset(8, 8),
                                        ),
                                        BoxShadow(
                                          color: black.withOpacity(0.2),
                                          spreadRadius: 0,
                                          blurRadius: 4,
                                          offset: Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.center,
                                        child: IconButton(
                                          icon: Icon(Iconsax.send1),
                                          iconSize: 18,
                                          color: white,
                                          onPressed: () {},
                                        )),
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(height: 40)
                    ],
                  )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
