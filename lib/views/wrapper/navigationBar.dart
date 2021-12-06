import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import views
import 'package:grow_app/views/dashboardManagement/dashboardCenter.dart';
import 'package:grow_app/views/projectManagement/projectCenter.dart';
import 'package:grow_app/views/timelineManagement/timelineCenter.dart';
import 'package:grow_app/views/messageManagement/messageCenter.dart';
import 'package:grow_app/views/profileManagement/profileCenter.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:iconsax/iconsax.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meta/meta.dart';

class navigationBar extends StatefulWidget {
  String uid;

  navigationBar(Required required, {Key? key, required this.uid}) : super(key: key);
  @override
  _navigationBarState createState() => _navigationBarState(uid);
}

class _navigationBarState extends State<navigationBar>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  String uid = "";

  _navigationBarState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;

  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
  }
  
  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          dashboardCenterScreen(required, uid: uid),
          projectCenterScreen(required, uid: uid),
          timelineCenterScreen(required, uid: uid),
          messageCenterScreen(required, uid: uid),
          profileCenterScreen(required, uid: uid)
        ],
        controller: _tabController,
        //onPageChanged: whenPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        height: 48 + 50,
        padding: EdgeInsets.only(
            bottom: 50,
            left: (MediaQuery.of(context).size.width - 280) / 2,
            right: (MediaQuery.of(context).size.width - 280) / 2),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
          child: Container(
            color: purpleMain,
            child: TabBar(
              labelColor: whiteLight,
              unselectedLabelColor: purpleHide,
              // indicator: UnderlineTabIndicator(
              //   borderSide: BorderSide(color: blackLight, width: 0.0),
              // ),
              //For Indicator Show and Customization
              indicatorColor: purpleMain,
              padding: EdgeInsets.only(right: 4, top: 8, bottom: 8),
              tabs: <Widget>[
                Tab(
                    // icon: Icon(navbarIcons.grid_big, size: 32)
                    icon: Icon(Iconsax.element_4, size: 24)),
                    // icon: Icon(Icons.space_dashboard_rounded, size: 24)),
                Tab(
                    icon: Icon(Iconsax.folder_2, size: 24)),
                    // icon: Icon(Icons.task_rounded, size: 24)),
                Tab(
                    icon: Icon(Iconsax.calendar_1, size: 24)),
                    // icon: Icon(Icons.calendar_today_rounded, size: 24)),
                Tab(
                    icon: Icon(Iconsax.message_text, size: 24)),
                    // icon: Icon(Icons.chat_rounded, size: 24)),
                Tab(
                    icon: Icon(Iconsax.user_octagon, size: 24)),
                    // icon: Icon(Icons.person_outline_rounded, size: 24)),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
