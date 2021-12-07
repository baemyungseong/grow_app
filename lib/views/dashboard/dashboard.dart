import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:grow_app/views/dashboard/projecrCard.dart';
import 'package:iconsax/iconsax.dart';
import 'package:grow_app/views/dashboard/circleProgress.dart';
import 'package:date_time/date_time.dart';
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

class DashboardPage extends StatefulWidget {
  String uid;

  DashboardPage(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState(uid);
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  String? uid = "";
  late AnimationController _animatedController;
  late Animation<double> _animation;
  List<ProjectCardInfo> projectcards = [
    ProjectCardInfo(
        deadline: '10:00 AM',
        projectName: 'Design Logo Foody',
        description: 'Design logo shoe shop which name is... ')
  ];

  _DashboardPageState(String uid);

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid;

    _animatedController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _animation = Tween<double>(begin: 0, end: 41).animate(_animatedController)
      ..addListener(() {
        setState(() {});
      });
    //
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
        child: Scaffold(
            body: SingleChildScrollView(
                padding: EdgeInsets.all(appFixedPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                width: 32,
                                height: 32,
                                decoration: new BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          // '${projects[index]!["background"]}'),
                                          'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.rectangle,
                                ),
                              ),
                              SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Pan Cái Chảo',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )),
                                  // SizedBox(width: 4),
                                  Container(
                                      // alignment: Alignment.topLeft,
                                      child: Text('Project Director',
                                          style: TextStyle(
                                            fontSize: 10,
                                            fontFamily: 'Poppins',
                                            color: black,
                                            fontWeight: FontWeight.w400,
                                          ))),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              // padding: EdgeInsets.only(right: 28),
                              alignment: Alignment.center,
                              child: GestureDetector(
                                // onTap: () {
                                //   Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //       builder: (context) =>
                                //           notificationCenterScreen(required, uid: uid),
                                //     ),
                                //   );
                                // },
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
                      SizedBox(height: 24),
                      Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Poppins',
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomPaint(
                            foregroundPainter: CircleProgress(_animation.value),
                            child: Container(
                                width: 160,
                                height: 160,
                                child: GestureDetector(
                                  onTap: () {
                                    if (_animation.value == 41) {
                                      _animatedController.reverse();
                                    } else {
                                      _animatedController.forward();
                                    }
                                  },
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '26',
                                            style: TextStyle(
                                              fontSize: 28,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Total Project',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              color: greyDark,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 24),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                color: orange,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                          Text(
                                            '41%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Done',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: greyDark,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                color: yallow,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                          Text(
                                            '23%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'To do',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: greyDark,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(right: 8),
                                              height: 10,
                                              width: 10,
                                              decoration: BoxDecoration(
                                                color: blue,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              )),
                                          Text(
                                            '35%',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Pending',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          color: greyDark,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Pending Project',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                color: black,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'view all',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: greyDark,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(top: 32),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 150,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: purpleLight,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 16, top: 16),
                                              child: Text(
                                                'Oct 25,2021',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design Logo Foody',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design logo shoe ',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              height: 10,
                                              width: 86,
                                              decoration: BoxDecoration(
                                                  color: orange,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
                                        width: 150,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: purpleLight,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 16, top: 16),
                                              child: Text(
                                                'Oct 25,2021',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design Logo Uber',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design logo shoe ',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              height: 10,
                                              width: 86,
                                              decoration: BoxDecoration(
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))
                                  ])),
                          Container(
                              margin: EdgeInsets.only(top: 32),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: 150,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: purpleLight,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 16, top: 16),
                                              child: Text(
                                                'Oct 25,2021',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design Logo shopee',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design logo shoe ',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              height: 10,
                                              width: 86,
                                              decoration: BoxDecoration(
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
                                        width: 150,
                                        height: 160,
                                        decoration: BoxDecoration(
                                            color: purpleLight,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 16, top: 16),
                                              child: Text(
                                                'Oct 25,2021',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design Logo Foody',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'Poppins',
                                                  color: black,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              child: Text(
                                                'Design logo shoe ',
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'Poppins',
                                                  color: greyDark,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 16),
                                            Container(
                                              margin: EdgeInsets.only(left: 16),
                                              height: 10,
                                              width: 86,
                                              decoration: BoxDecoration(
                                                  color: blue,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  width: 24,
                                                  height: 24,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-1/p480x480/259507941_1162683510806374_690586520604516558_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=7206a8&_nc_ohc=FtBeikuPI4cAX_rzDg2&_nc_ht=scontent.fvca1-4.fna&oh=8b217f922b39fac368818444711a410a&oe=61B1EDC7'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))
                                  ])),
                        ],
                      )
                      // ListView(
                      //   children:projectcards.map((e)){
                      //   return Container();

                      //   }).toL
                      // )
                    ]))));
  }
}
