import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';
import 'package:grow_app/models/messageModel.dart';
import 'package:grow_app/models/userModel.dart';

//import views
import 'package:grow_app/views/message/messageDetail.dart';
import 'package:grow_app/views/profile/notificationCenter.dart';
import 'package:grow_app/views/profile/profileCenter.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class messageCenterScreen extends StatefulWidget {
  String uid;

  messageCenterScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _messageCenterScreenState createState() => _messageCenterScreenState(uid);
}

class _messageCenterScreenState extends State<messageCenterScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  _messageCenterScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
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
  // late MessageModel message =
  //     MessageModel(userIdS1: '', userIdS2: '', messageId: '', contentList: []);
  List<UserModel> userList = [];

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

  Future getAllUser() async {
    FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((value) => value.docs.forEach((element) {
              setState(() {
                if (uid.contains(element.data()['userId'] as String)) {
                } else {
                  userList.add(UserModel.fromDocument(element.data()));
                }
              });
            }));
    print(userList.length);
  }

  String newMessageId = "";
  List assignedMessage = [];
  Future createMessage(String userIdS2) async {
    // FirebaseFirestore.instance
    //     .collection("messages")
    //     .get()
    //     .then((value) => value.docs.forEach((element) {
    //           assignedMessage.add(uid);
    //           assignedMessage.add(userIdS2);
    //           if (assignedMessage.contains(element.data()['assignedMessage'] as String)) {
    //           } else {}
    FirebaseFirestore.instance.collection("messages").add({
      'assignedMessage': FieldValue.arrayUnion([uid, userIdS2]),
      'contentList': FieldValue.arrayUnion([""]),
    }).then(
      (value) => FirebaseFirestore.instance
          .collection("messages")
          .doc(value.id)
          .update({
        'messageId': newMessageId = value.id,
      }),
    );
  }
  // }
  // ));

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
    getAllUser();
    getUserDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: purpleLight,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 64),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        profileCenterScreen(required, uid: uid),
                                  ),
                                ).then((value) {});
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 32,
                                width: 32,
                                decoration: BoxDecoration(
                                  color: purpleDark,
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                      image: NetworkImage(user.avatar),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.rectangle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.25),
                                      spreadRadius: 0,
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                    BoxShadow(
                                      color: black.withOpacity(0.1),
                                      spreadRadius: 0,
                                      blurRadius: 60,
                                      offset: Offset(10, 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    user.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        color: black,
                                        fontWeight: FontWeight.w600,
                                        height: 1.2),
                                  )),
                              SizedBox(width: 4),
                              Container(
                                  // alignment: Alignment.topLeft,
                                  child: Text(user.job,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        color: greyDark,
                                        fontWeight: FontWeight.w400,
                                      ))),
                            ],
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                          // padding: EdgeInsets.only(right: 28),
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      notificationCenterScreen(required,
                                          uid: uid),
                                ),
                              );
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
                                      offset: Offset(8, 8)),
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
                                  child: Icon(Iconsax.notification,
                                      size: 18, color: white)),
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(left: 28),
                  child: Text(
                    "Chat Message",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 24.0,
                        color: black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                          padding: EdgeInsets.only(left: 28),
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
                              height: 48,
                              width: 48,
                              decoration: BoxDecoration(
                                color: purpleDark,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Container(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.center,
                                  child: Icon(Iconsax.search_normal,
                                      size: 18, color: white)),
                            ),
                          )),
                      SizedBox(width: 4),
                      Container(
                        width: 367,
                        height: 48,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: userList.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  padding: EdgeInsets.only(left: 4, right: 4),
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                      createMessage(userList[index].userId);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              messageDetailScreen(required,
                                                  uid: uid,
                                                  uid2: userList[index].userId),
                                        ),
                                      );
                                    },
                                    child: AnimatedContainer(
                                      alignment: Alignment.center,
                                      duration: Duration(milliseconds: 300),
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: purpleDark,
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                      child: Container(
                                        alignment: Alignment.bottomCenter,
                                        width: 48,
                                        height: 48,
                                        decoration: new BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  // '${projects[index]!["background"]}'),
                                                  userList[index].avatar),
                                              fit: BoxFit.cover),
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ));
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  height: 580,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36)),
                    color: white,
                  ),
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 24),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 16,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(top: 10, bottom: 10),
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) =>
                                //         dashboardCenterScreen(required, uid: uid),
                                //   ),
                                // );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    height: 60,
                                    decoration: new BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              // '${projects[index]!["background"]}'),
                                              'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 64,
                                    width: 232,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              width: 180,
                                              child: Text(
                                                'Bang Bro Best',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontFamily: "Poppins",
                                                    fontSize: 14.0,
                                                    color: black,
                                                    fontWeight: FontWeight.w600,
                                                    height: 1.4),
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              '14:05',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 12.0,
                                                  color: black,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: 232,
                                          child: Text(
                                            "Can I call you back later? I'm in a man do you",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12.0,
                                                color: black,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
