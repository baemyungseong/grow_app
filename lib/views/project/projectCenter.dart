import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import views
import 'package:grow_app/views/profile/notificationCenter.dart';
import 'package:grow_app/views/project/dailyTaskEditing.dart';
import 'package:grow_app/views/project/projectManagement.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';
import 'package:custom_check_box/custom_check_box.dart';

class projectCenterScreen extends StatefulWidget {
  String uid;

  projectCenterScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _projectCenterScreenState createState() => _projectCenterScreenState(uid);
}

class _projectCenterScreenState extends State<projectCenterScreen> with SingleTickerProviderStateMixin {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  _projectCenterScreenState(uid);

  TabController? _tabController;
  int _selectedIndex = 0;

  List<String> _listImageInprogress = [clockProject, taskProject, clockProject];
  List<String> _listImageTodo = [taskProject, clockProject, taskProject, clockProject];
  List<String> _listImageDone = [clockProject, taskProject, clockProject, taskProject, clockProject];
  double _currentPosition = 1.0;

  bool checkBoxValue = false;


  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;

  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 28),
                      width: 32,
                      height: 32,
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                // '${projects[index]!["background"]}'),
                                'https://lh3.googleusercontent.com/a-/AOh14GhaZE3tqUxagut4wGtdcGM8MXueJWinnDVLejhO=s1337'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Smith Brown.D",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 16.0,
                              color: black,
                              fontWeight: FontWeight.w600,
                              height: 1.0),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Project Director",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 10.0,
                              color: greyDark,
                              fontWeight: FontWeight.w400,
                              height: 1.0),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                        padding: EdgeInsets.only(right: 28),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => notificationCenterScreen(
                                    required,
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
                                child: Icon(Iconsax.notification,
                                    size: 18, color: white)),
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 24),
                Container(
                  alignment: Alignment.center,
                  child: Form(
                    // key: formKey,
                    child: Container(
                      width: 280,
                      height: 40,
                      padding: EdgeInsets.only(left: 2, right: 24),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: purpleLight),
                      alignment: Alignment.topCenter,
                      child: TextFormField(
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: black,
                              fontWeight: FontWeight.w400),
                          controller: searchController,
                          keyboardType: TextInputType.text,
                          // validator: (value) => value.isEmpty
                          //     ? 'Password is required'
                          //     : null,
                          // validator: MultiValidator([
                          //   RequiredValidator(
                          //       errorText: "Password Is Required"),
                          //   MinLengthValidator(6,
                          //       errorText:
                          //           "Minimum 6 Characters Required"),
                          // ]),
                          // onChanged: (val) {
                          //   password = val;
                          // },
                          decoration: InputDecoration(
                            prefixIcon: Container(
                                child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                  Icon(Iconsax.search_normal_1,
                                      size: 20, color: black)
                                ])),
                            border: InputBorder.none,
                            hintText: "What are you looking for?",
                            hintStyle: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w400),
                          )),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Project",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24.0,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => projectManagementScreen(
                                      required,
                                      uid: uid),
                                ),
                              );
                            },
                            child: Text(
                              "View all",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: greyDark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                  child: TabBar(
                    controller: _tabController,
                    labelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: black,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontFamily: 'Poppins',
                      color: greyDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 16
                    ),
                    
                    // indicator: UnderlineTabIndicator(
                    //   borderSide: BorderSide(color: blackLight, width: 0.0),
                    // ),
                    //For Indicator Show and Customization
                    // indicatorColor: purpleMain,
                    labelPadding: EdgeInsets.symmetric(horizontal: 12),
                    padding: EdgeInsets.only(left: 14, right: 0, top: 0, bottom: 0),
                    isScrollable: true,
                    onTap: (value) {
                      setState(() {
                        _tabController != _tabController;
                      });
                    },
                    tabs: [
                      Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              width: 95.0,
                              child: new Tab(text: 'In progress', height: (_selectedIndex == 0) ? 40 : 40),
                            ),
                            (_selectedIndex == 0) ? Container(
                              width: 6,
                              height: 6,
                              decoration: new BoxDecoration(
                                color: black,
                                shape: BoxShape.circle,
                              ),
                            ) : SizedBox(height: 6),
                          ],
                        ),
                      Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              width: 50,
                              child: new Tab(text: 'To do', height: (_selectedIndex == 1) ? 40 : 40),
                            ),
                            (_selectedIndex == 1)
                                ? Container(
                                    width: 6,
                                    height: 6,
                                    decoration: new BoxDecoration(
                                      color: black,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : SizedBox(height: 6),
                          ],
                        ),
                      Column(
                          children: [
                            Container(
                              alignment: Alignment.topCenter,
                              width: 50,
                              child: new Tab(text: 'Done', height: (_selectedIndex == 2) ? 40 : 40),
                            ),
                            (_selectedIndex == 2)
                                ? Container(
                                    width: 6,
                                    height: 6,
                                    decoration: new BoxDecoration(
                                      color: black,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                : SizedBox(height: 6),
                          ],
                        ),
                      // Tab(text: 'In progress'),
                      // Tab(text: "To do"),
                      // Tab(text: "Done")
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  width: double.maxFinite,
                  height: 300,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      // Container(
                      //  height: 169,
                      //  width: 267,
                      //  padding: EdgeInsets.only(left: 2, right: 24),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     color: purpleLight
                      //   ),
                      // ),
                      Container(
                          height: 169,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: PageView.builder(
                              controller: PageController(
                                  initialPage: 1,
                                  keepPage: true,
                                  viewportFraction: 0.6),
                              itemCount: _listImageInprogress.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (num) {
                                setState(() {
                                  if (num + 1 == _listImageInprogress.length) {
                                    _currentPosition = 2.0;
                                  } else if (num == 0) {
                                    _currentPosition = 0.0;
                                  } else {
                                    _currentPosition = num.toDouble();
                                  }
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: AssetImage(_listImageInprogress[index]),
                                        fit: BoxFit.contain),
                                  ),
                                );
                              }
                          )
                      ),
                      Container(
                          height: 169,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: PageView.builder(
                              controller: PageController(
                                  initialPage: 1,
                                  keepPage: true,
                                  viewportFraction: 0.6),
                              itemCount: _listImageTodo.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (num) {
                                setState(() {
                                  if (num + 1 == _listImageTodo.length) {
                                    _currentPosition = 2.0;
                                  } else if (num == 0) {
                                    _currentPosition = 0.0;
                                  } else {
                                    _currentPosition = num.toDouble();
                                  }
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            _listImageTodo[index]),
                                        fit: BoxFit.contain),
                                  ),
                                );
                              }
                          )
                      ),
                      Container(
                          height: 169,
                          decoration: BoxDecoration(color: Colors.transparent),
                          child: PageView.builder(
                              controller: PageController(
                                  initialPage: 1,
                                  keepPage: true,
                                  viewportFraction: 0.6),
                              itemCount: _listImageDone.length,
                              scrollDirection: Axis.horizontal,
                              onPageChanged: (num) {
                                setState(() {
                                  if (num + 1 == _listImageDone.length) {
                                    _currentPosition = 2.0;
                                  } else if (num == 0) {
                                    _currentPosition = 0.0;
                                  } else {
                                    _currentPosition = num.toDouble();
                                  }
                                });
                              },
                              itemBuilder: (context, index) {
                                return Container(
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 14.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            _listImageDone[index]),
                                        fit: BoxFit.contain),
                                  ),
                                );
                              }
                          )
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Daily task",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 24.0,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => dailyTaskEditingScreen(required, uid: uid),
                                ),
                              );
                            },
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: greyDark,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 12),
                Container(
                    padding: EdgeInsets.only(
                        left: appPaddingInApp, right: appPaddingInApp),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: 4,
                      // itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return Container(
                            width: 319,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Color(0xFFFFF8E8),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            margin: EdgeInsets.only(top: 8, bottom: 8.0),
                            child: Container(
                                padding: EdgeInsets.only(left: 16, right: 4),
                                child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 245,
                                          child: Text(
                                            "Morning standup I Routine",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 12.0,
                                                color: black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          // padding: const EdgeInsets.only(right: 23.0),
                                          alignment: Alignment.topRight,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10)),
                                          child: new CustomCheckBox(
                                              value: checkBoxValue,
                                              shouldShowBorder: true,
                                              borderColor: Color(0xFFFABB18),
                                              checkedFillColor: Color(0xFFFABB18),
                                              checkedIconColor: white,
                                              borderRadius: 4,
                                              borderWidth: 1.5,
                                              checkBoxSize: 16,
                                              // onChanged: _activeCheckAccept,
                                              onChanged: (bool newValue) {
                                                setState(() {
                                                  checkBoxValue = newValue;
                                                });
                                              }
                                          ),
                                        ),
                                      ],
                                    ),
                            )
                        );
                      },
                    ),
                  ),
              ]
            )
          )
        ],
      ),
    );
  }
}
