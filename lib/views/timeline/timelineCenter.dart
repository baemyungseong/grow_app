import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:grow_app/views/profile/notificationCenter.dart';
import 'package:grow_app/views/profile/profileCenter.dart';
import 'package:iconsax/iconsax.dart';

//import widgets
import 'package:grow_app/views/widget/dialogWidget.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import others
import 'package:blur/blur.dart';
import 'package:meta/meta.dart';
import 'package:custom_check_box/custom_check_box.dart';

class timelineCenterScreen extends StatefulWidget {
  String uid;

  timelineCenterScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _timelineCenterScreenState createState() => _timelineCenterScreenState(uid);
}

class _timelineCenterScreenState extends State<timelineCenterScreen> {
  String uid = "";

  bool checkBoxValue = false;

  _timelineCenterScreenState(String uid);
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: SingleChildScrollView(
            padding: EdgeInsets.all(appPaddingInApp),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 36),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            // width: 32,
                            // height: 32,
                            // decoration: new BoxDecoration(
                            //   borderRadius:
                            //       BorderRadius.all(Radius.circular(8)),
                            //   image: DecorationImage(
                            //       image: NetworkImage(
                            //           // '${projects[index]!["background"]}'),
                            //           'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                            //       fit: BoxFit.cover),
                            //   shape: BoxShape.rectangle,
                            // ),
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
                                      image: NetworkImage(
                                          // '${projects[index]!["background"]}'),
                                          'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
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
                                    'Pan Cái Chaor',
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
                                  child: Text('Project Director',
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
                  SizedBox(height: 20),
                  Text(
                    'Timeline',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Poppins',
                      color: black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // SizedBox(height: 24),
                  Container(
                    margin: EdgeInsets.only(top: 24, bottom: 8),
                    // padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          buildDateColumn('S', 7, false),
                          buildDateColumn('M', 8, false),
                          buildDateColumn('T', 9, false),
                          buildDateColumn('W', 10, true),
                          buildDateColumn('T', 11, false),
                          buildDateColumn('F', 12, false),
                          buildDateColumn('S', 13, false),
                        ]),
                  ),
                  Column(
                    children: [
                      buildCardTask('08:00 AM'),
                      buildCardTask('09:00 AM'),
                      buildCardTask('10:00 AM'),
                    ],
                  )
                ])),
      ),
    );
  }

  Container buildCardTask(String hour) {
    return Container(
      margin: EdgeInsets.only(top: 32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Container(
                  width: 15,
                  height: 10,
                  decoration: BoxDecoration(
                      color: purpleDark,
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(4)))),
              SizedBox(width: 16),
              Text(
                hour,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  color: black,
                  fontWeight: FontWeight.w600,
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Container(
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: purpleLight,
                    spreadRadius: -16,
                    blurRadius: 24,
                    offset: Offset(0, 28), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  buildTask('Morning standup I Routine'),
                  buildTask('Organizing Trello board and build folder structure on my github'),
                  buildTask('Organizing Notion board '),
                  buildTask('Choosing logo color for Fresh'),
                ],
              ))
        ],
      ),
    );
  }

  Container buildTask(String taskName) {
    return Container(
        margin: EdgeInsets.only(top: 8),
        height: 48,
        decoration: BoxDecoration(
          color: purpleLight,
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 16),
            Container(
              width: 245,
              alignment: Alignment.centerLeft,
              child: Text(
                taskName,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  color: black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Spacer(),
            Container(
              padding: const EdgeInsets.only(right: 4.0),
              alignment: Alignment.topRight,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: new CustomCheckBox(
                  value: checkBoxValue,
                  shouldShowBorder: true,
                  borderColor: purpleHide,
                  checkedFillColor: purpleHide,
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
            // Container(
            //     width: 18,
            //     height: 18,
            //     decoration: BoxDecoration(
            //       color: white,
            //       // borderRadius: BorderRadius.all(Radius.circular(4))
            //       border: Border(
            //         top: BorderSide(
            //             width: 2.0, color: todoColor, style: BorderStyle.solid),
            //         left: BorderSide(
            //             width: 2.0, color: todoColor, style: BorderStyle.solid),
            //         right: BorderSide(
            //             width: 2.0, color: todoColor, style: BorderStyle.solid),
            //         bottom: BorderSide(
            //             width: 2.0, color: todoColor, style: BorderStyle.solid),
            //       ),
            //     )
            // ),
          ],
        )
    );
  }

  Container buildDateColumn(String weekDay, int date, bool isActive) {
    return Container(
      height: 52,
      width: 36,
      decoration: isActive
          ? BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              color: purpleDark,
            )
          : BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)), color: white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(weekDay,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Poppins',
                color: isActive ? white : greyDark,
                fontWeight: FontWeight.w400,
              )),
          SizedBox(height: 2),
          Text(date.toString(),
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: isActive ? white : black,
                fontWeight: FontWeight.w600,
              ))
        ],
      ),
    );
  }
}
