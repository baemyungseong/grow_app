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
import 'package:grow_app/models/messageModel.dart';
import 'package:grow_app/models/userModel.dart';
import 'package:grow_app/views/profile/notificationCenter.dart';
import 'package:grow_app/views/profile/profileCenter.dart';
import 'package:intl/intl.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class messageDetailScreen extends StatefulWidget {
  String uid;
  String uid2;
  String messagesId;

  messageDetailScreen(Required required,
      {Key? key,
      required this.uid,
      required this.uid2,
      required this.messagesId})
      : super(key: key);

  @override
  _messageDetailScreenState createState() =>
      _messageDetailScreenState(uid, uid2, this.messagesId);
}

class _messageDetailScreenState extends State<messageDetailScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";
  String uid2 = '';
  String messagesId = "";

  _messageDetailScreenState(uid, this.uid2, this.messagesId);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;
  // Message chatting = Message(userId: '', message: '', createAt: '');
  List<Message> chatting = [];

  TextEditingController messageController = TextEditingController();
  GlobalKey<FormState> messageFormKey = GlobalKey<FormState>();
  String message = '';
  late UserModel user = UserModel(
      avatar: '',
      dob: '',
      email: '',
      name: '',
      job: '',
      phonenumber: '',
      projectsList: [],
      tasksList: [],
      userId: '');
  Future getUserDetail() async {
    FirebaseFirestore.instance
        .collection("users")
        .where("userId", isEqualTo: uid)
        .snapshots()
        .listen((value) {
      setState(() {
        user = UserModel.fromDocument(value.docs.first.data());
      });
    });
  }

  Future sendMessage(String message) async {
    if (message.isNotEmpty) {
      FirebaseFirestore.instance.collection("contents").add({
        'content': message,
        'sendBy': uid,
        'messageId': messagesId,
        'timeSend': "${DateFormat('hh:mm a').format(DateTime.now())}",
      }).then((value) => FirebaseFirestore.instance
              .collection("messages")
              .doc(messagesId)
              .update({
            'contentList': FieldValue.arrayUnion([value.id]),
          }));
      message = "";
    }
  }

  Future getMessage() async {
    FirebaseFirestore.instance
        .collection("contents")
        .get()
        .then((value) => setState(() {
              value.docs.forEach((element) {
                if (messagesId
                    .contains(element.data()['messagesId'] as String)) {
                  chatting.add(Message.fromDocument(element.data()));
                }
              });
            }));
  }

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
    getUserDetail();
    getMessage();
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
                                    padding: EdgeInsets.only(
                                        left: appPaddingInApp,
                                        right: appPaddingInApp),
                                    child: ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: chatting.length,
                                        itemBuilder: (context, index) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                                left: 28, right: 28),
                                            child: Row(
                                              children: [
                                                Container(
                                                  alignment:
                                                      Alignment.bottomCenter,
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
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    24.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    24.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    24.0)),
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
                                                          fontWeight:
                                                              FontWeight.w400),
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
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ))),
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
                                      onPressed: () {
                                        sendMessage(message);
                                        getMessage();
                                        print(message);
                                        print(chatting.length);
                                      },
                                    )),
                              ),
                            ),
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
