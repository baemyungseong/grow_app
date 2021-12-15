import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';
import 'package:grow_app/views/project/circleProgressProject.dart';
import 'package:grow_app/views/project/projectEditing.dart';
import 'package:grow_app/views/task/taskCreating.dart';

//import widgets
import 'package:grow_app/views/widget/dialogWidget.dart';

//import views
import 'package:grow_app/views/project/projectManagement.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dotted_border/dotted_border.dart';

class projectDetailScreen extends StatefulWidget {
  String uid;

  projectDetailScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _projectDetailScreenState createState() => _projectDetailScreenState(uid);
}

class _projectDetailScreenState extends State<projectDetailScreen> with SingleTickerProviderStateMixin {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  int selected = 0;

  _projectDetailScreenState(uid);

  TabController? _tabController;
  int _selectedIndex = 0;
  double _currentPosition = 1.0;

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _tabController != _tabController;
      });
      _selectedIndex = _tabController!.index;
      print(_selectedIndex);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
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
                SizedBox(height: 64),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end, 
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
                      padding: EdgeInsets.only(bottom: 6, right: 28),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    projectEditingScreen(required, uid: uid),
                              ),
                            );
                          },
                          child: Text(
                            "Edit",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: greyDark,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          )
                      ),
                    )
                  ]
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, 
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Container(
                            child: Text(
                              "Design Logo Foody",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 24.0,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: Text(
                              "A digital Agency building functional, simple and you think you love me fnd skcnsk nư ndkcn sns ndn nsn kwnd nnsn!",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12.0,
                                color: greyDark,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 24),
                      Container(
                        width: 319,
                        height: 48,
                        padding: EdgeInsets.only(top: 8, left: 16, bottom: 8, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: purpleLight
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Icon(Iconsax.notification_1, size: 20, color: purpleMain),
                            ),
                            SizedBox(width: 16),
                            Container(
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: greyDark,
                                    fontWeight: FontWeight.w500,
                                    // height: 1.6,
                                  ),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Deadline: ',
                                    ),
                                    TextSpan(
                                      text: 'November 12, at 12:00 AM',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: black
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              child: CustomPaint(
                                foregroundPainter: circleProgressProject(75),
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "75%",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 8.0,
                                        color: purpleMain,
                                        fontWeight: FontWeight.w500
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ]
                        ),
                      ),
                      SizedBox(height: 24),
                      Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Team Members",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 20.0,
                                      color: black,
                                      fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            decoration: new BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      // '${projects[index]!["background"]}'),
                                                      'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 30),
                                            width: 40,
                                            height: 40,
                                            decoration: new BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      // '${projects[index]!["background"]}'),
                                                      'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/74483881_541590829928084_9212411211595907072_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=_BcQsQo3ihUAX_iFJNa&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8yxbwpnASSB_vCn5GyqKTnu7aK4_HSbDxGf6MLdvxBYA&oe=61DCB50E'),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 60),
                                            width: 40,
                                            height: 40,
                                            decoration: new BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      // '${projects[index]!["background"]}'),
                                                      'https://scontent.fvca1-1.fna.fbcdn.net/v/t1.6435-9/118666658_773803373373494_7627067148918353440_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=174925&_nc_ohc=ljoRfZ1r_BoAX9RQM-h&_nc_ht=scontent.fvca1-1.fna&oh=00_AT8J4KsBAlY42aEFNyCqYxjIlYgpaXu4wUIenUSOhwBS5g&oe=61DE4503'),
                                                  fit: BoxFit.cover),
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 90),
                                            alignment: Alignment.center,
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => projectEditingScreen(required, uid: uid),
                                                  ),
                                                );
                                              },
                                              child: AnimatedContainer(
                                                alignment: Alignment.center,
                                                duration: Duration(milliseconds: 300),
                                                child: DottedBorder(
                                                  child: Container(
                                                    width: 36,
                                                    height: 36,
                                                    decoration: new BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      child: Icon(Iconsax.add, size: 24, color: greyDark),
                                                    ),
                                                  ),
                                                  borderType: BorderType.Oval,
                                                  color: greyDark,
                                                  dashPattern: [10, 5, 10, 5, 10, 5],
                                                ),
                                              ),
                                            )
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ]
                          ),
                        ],
                      ),
                    ]
                  ),
                ),
                SizedBox(height: 32),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    padding: EdgeInsets.only(left: 28),
                    labelPadding: EdgeInsets.only(right: 16),
                    isScrollable: true,
                    onTap: (value) {
                      setState(() {
                        _tabController != _tabController;
                      });
                    },
                    tabs: [
                      Container(
                        width: 80,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: (_selectedIndex == 0) ? purpleMain : white
                        ),
                        alignment: Alignment.center,
                        child: Tab(
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: (_selectedIndex == 0) ? white : greyDark,
                                  fontWeight: FontWeight.w500,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text:
                                      'All',
                                ),
                                TextSpan(
                                  text: ' 4',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (_selectedIndex == 1) ? purpleMain : white),
                        alignment: Alignment.center,
                        child: Tab(
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: (_selectedIndex == 1) ? white : greyDark,
                                fontWeight: FontWeight.w500,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Todo',
                                ),
                                TextSpan(
                                  text: ' 1',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (_selectedIndex == 2) ? purpleMain : white),
                        alignment: Alignment.center,
                        child: Tab(
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: (_selectedIndex == 2) ? white : greyDark,
                                fontWeight: FontWeight.w500,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Pending',
                                ),
                                TextSpan(
                                  text: ' 2',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 36,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: (_selectedIndex == 3) ? purpleMain : white),
                        alignment: Alignment.center,
                        child: Tab(
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: (_selectedIndex == 3) ? white : greyDark,
                                fontWeight: FontWeight.w500,
                              ),
                              children: const <TextSpan>[
                                TextSpan(
                                  text: 'Done',
                                ),
                                TextSpan(
                                  text: ' 1',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 16),
                  width: double.maxFinite,
                  height: 340,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      //All Tabbar
                      Container(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 4,
                          // itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: 319,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: purpleLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin: EdgeInsets.only(top: 8, bottom: 8.0, left: appPaddingInApp, right: appPaddingInApp),
                                child: Container(
                                  padding: EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 24),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  width: 213,
                                                  child: Text(
                                                    "Create new blog post",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 16.0,
                                                      color: black,
                                                      fontWeight: FontWeight.w600
                                                    ),
                                                  )
                                                ),
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 168,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.zero,
                                                        alignment: Alignment.center,
                                                        child: Icon(
                                                          Iconsax.calendar_1,
                                                          size: 16,
                                                          color: greyDark
                                                        )
                                                      ),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        "Till 10 May, 2021",
                                                        overflow: TextOverflow.ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 12.0,
                                                          color: greyDark,
                                                          fontWeight: FontWeight.w400
                                                        ),
                                                      ),
                                                    ]
                                                  ),
                                                )
                                              ]
                                          )
                                      ),
                                      Spacer(),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(height: 8),
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: new BoxDecoration(
                                                    color: (index == 0)
                                                        ? doneColor
                                                        : ((index == 1)
                                                          ? todoColor
                                                          : pendingColor),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Spacer(),
                                                Container(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Container(
                                                            width: 20,
                                                            height: 20,
                                                            decoration:
                                                                new BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      // '${projects[index]!["background"]}'),
                                                                      'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                                  fit: BoxFit.cover),
                                                              shape: BoxShape.circle,
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 14),
                                                            width: 20,
                                                            height: 20,
                                                            decoration:
                                                                new BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: NetworkImage(
                                                                      // '${projects[index]!["background"]}'),
                                                                      'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/74483881_541590829928084_9212411211595907072_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=_BcQsQo3ihUAX_iFJNa&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8yxbwpnASSB_vCn5GyqKTnu7aK4_HSbDxGf6MLdvxBYA&oe=61DCB50E'),
                                                                  fit: BoxFit.cover),
                                                              shape: BoxShape.circle,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                          )
                                      ),
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      ),
                      //Todo Tabbar
                      Container(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 4,
                          // itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: 319,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: purpleLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin: EdgeInsets.only(
                                    top: 8,
                                    bottom: 8.0,
                                    left: appPaddingInApp,
                                    right: appPaddingInApp),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 24, top: 12, bottom: 12, right: 24),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            Container(
                                                width: 213,
                                                child: Text(
                                                  "Confirm Project with founder",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 16.0,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            SizedBox(height: 8),
                                            Container(
                                              width: 168,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.zero,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                            Iconsax.calendar_1,
                                                            size: 16,
                                                            color: greyDark)),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "Till 12 May, 2021",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 12.0,
                                                          color: greyDark,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ]),
                                            )
                                          ])),
                                      Spacer(),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                            SizedBox(height: 8),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: new BoxDecoration(
                                                color: (index == 0)
                                                    ? doneColor
                                                    : ((index == 1)
                                                        ? todoColor
                                                        : pendingColor),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            new BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  // '${projects[index]!["background"]}'),
                                                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                              fit: BoxFit.cover),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 14),
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            new BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  // '${projects[index]!["background"]}'),
                                                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/74483881_541590829928084_9212411211595907072_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=_BcQsQo3ihUAX_iFJNa&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8yxbwpnASSB_vCn5GyqKTnu7aK4_HSbDxGf6MLdvxBYA&oe=61DCB50E'),
                                                              fit: BoxFit.cover),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])
                                      ),
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      ),
                      //Pending Tabbar
                      Container(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 4,
                          // itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: 319,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: purpleLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin: EdgeInsets.only(
                                    top: 8,
                                    bottom: 8.0,
                                    left: appPaddingInApp,
                                    right: appPaddingInApp),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 24, top: 12, bottom: 12, right: 24),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            Container(
                                                width: 213,
                                                child: Text(
                                                  "Prepare for meeting",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 16.0,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            SizedBox(height: 8),
                                            Container(
                                              width: 168,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.zero,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                            Iconsax.calendar_1,
                                                            size: 16,
                                                            color: greyDark)),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "Till 13 May, 2021",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 12.0,
                                                          color: greyDark,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ]),
                                            )
                                          ])),
                                      Spacer(),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                            SizedBox(height: 8),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: new BoxDecoration(
                                                color: (index == 0)
                                                    ? doneColor
                                                    : ((index == 1)
                                                        ? todoColor
                                                        : pendingColor),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            new BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  // '${projects[index]!["background"]}'),
                                                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                              fit: BoxFit.cover),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 14),
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            new BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  // '${projects[index]!["background"]}'),
                                                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/74483881_541590829928084_9212411211595907072_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=_BcQsQo3ihUAX_iFJNa&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8yxbwpnASSB_vCn5GyqKTnu7aK4_HSbDxGf6MLdvxBYA&oe=61DCB50E'),
                                                              fit: BoxFit.cover),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])
                                      ),
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      ),
                      //Done Tabbar
                      Container(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: 3,
                          // itemCount: projects.length,
                          itemBuilder: (context, index) {
                            return Container(
                                width: 319,
                                height: 80,
                                decoration: BoxDecoration(
                                    color: purpleLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8))),
                                margin: EdgeInsets.only(
                                    top: 8,
                                    bottom: 8.0,
                                    left: appPaddingInApp,
                                    right: appPaddingInApp),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      left: 24, top: 12, bottom: 12, right: 24),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                            Container(
                                                width: 213,
                                                child: Text(
                                                  "Prepare for project",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 16.0,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                )),
                                            SizedBox(height: 8),
                                            Container(
                                              width: 168,
                                              child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                        padding: EdgeInsets.zero,
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(
                                                            Iconsax.calendar_1,
                                                            size: 16,
                                                            color: greyDark)),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "Till 14 May, 2021",
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          fontSize: 12.0,
                                                          color: greyDark,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ]),
                                            )
                                          ])),
                                      Spacer(),
                                      Container(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                            SizedBox(height: 8),
                                            Container(
                                              width: 10,
                                              height: 10,
                                              decoration: new BoxDecoration(
                                                color: (index == 0)
                                                    ? doneColor
                                                    : ((index == 1)
                                                        ? todoColor
                                                        : pendingColor),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Stack(
                                                    children: [
                                                      Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            new BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  // '${projects[index]!["background"]}'),
                                                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                              fit: BoxFit.cover),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            left: 14),
                                                        width: 20,
                                                        height: 20,
                                                        decoration:
                                                            new BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  // '${projects[index]!["background"]}'),
                                                                  'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/74483881_541590829928084_9212411211595907072_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=_BcQsQo3ihUAX_iFJNa&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8yxbwpnASSB_vCn5GyqKTnu7aK4_HSbDxGf6MLdvxBYA&oe=61DCB50E'),
                                                              fit: BoxFit.cover),
                                                          shape: BoxShape.circle,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ])
                                      ),
                                    ],
                                  ),
                                )
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              taskCreatingScreen(required, uid: uid),
                        ),
                      ).then((value) {
                        // getProjectsDataList();
                      });
                    },
                    child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        height: 42,
                        width: 132,
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
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                padding: EdgeInsets.zero,
                                alignment: Alignment.center,
                                child:
                                    Icon(Iconsax.add, size: 24, color: white)),
                            SizedBox(width: 4),
                            Text(
                              "New Task",
                              style: TextStyle(
                                  color: white,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ],
                        )
                    ),
                  )
              ),
              SizedBox(height: 50)
            ],
          )
        ],
      ),
    );
  }
}
