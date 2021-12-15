import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grow_app/views/task/taskDetail.dart';

//import widgets
import 'package:grow_app/views/widget/dialogWidget.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import views
import 'package:grow_app/views/profile/notificationCenter.dart';
import 'package:grow_app/views/dashboard/circleProgressDashboard.dart';
import 'package:grow_app/views/project/projectManagement.dart';
// import 'package:grow_app/views/dashboard/projecrCard.dart';

//import firebase
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:blur/blur.dart';
import 'package:meta/meta.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image/flutter_image.dart';

class dashboardCenterScreen extends StatefulWidget {
  String uid;

  dashboardCenterScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _dashboardCenterScreenState createState() => _dashboardCenterScreenState(uid);
}

class _dashboardCenterScreenState extends State<dashboardCenterScreen>
    with SingleTickerProviderStateMixin {
  String uid = "";
  late AnimationController _animatedController;
  late Animation<double> _animation;
  List<ProjectCardInfo> projectcards = [
    ProjectCardInfo(
        deadline: '10:00 AM',
        projectName: 'Design Logo Foody',
        description: 'Design logo shoe shop which name is... ')
  ];

  _dashboardCenterScreenState(String uid);

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;

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
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
            statusBarColor: Colors.transparent),
        child: Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(backgroundBasic), fit: BoxFit.cover),
                  ),
                ),
                SingleChildScrollView(
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
                                        builder: (context) => taskDetailScreen(required, uid: uid),
                                      ),
                                    ).then((value) {
                                    });
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
                                        fit: BoxFit.cover
                                      ),
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
                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
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
                        children: [
                          SizedBox(width: 8),
                          CustomPaint(
                            foregroundPainter: circleProgressDashboard(_animation.value),
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
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                          Spacer(),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 64,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: doneColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                )),
                                            Spacer(),
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
                                      ),
                                      SizedBox(height: 2),
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
                                SizedBox(height: 8),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 64,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: todoColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                )),
                                            Spacer(),
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
                                      ),
                                      SizedBox(height: 2),
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
                                SizedBox(height: 8),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        width: 64,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                                margin:
                                                    EdgeInsets.only(right: 8),
                                                height: 10,
                                                width: 10,
                                                decoration: BoxDecoration(
                                                  color: pendingColor,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                )),
                                            Spacer(),
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
                                      ),
                                      SizedBox(height: 2),
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
                          ),
                          SizedBox(width: 24),
                        ],
                      ),
                      SizedBox(height: 32),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Recent Project",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 20.0,
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
                                        builder: (context) =>
                                            projectManagementScreen(required,
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
                                        fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Column(
                        children: [
                          Container(
                              child: Row(children: [
                            Container(
                                width: 150,
                                height: 160,
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 12, bottom: 12),
                                decoration: BoxDecoration(
                                    color: purpleLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Oct 25,2021',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 86,
                                      child: Text(
                                        'Design Logo Foody',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 119,
                                      child: Text(
                                        'Design logo shoe shop which name is...',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 86,
                                          height: 7,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        Container(
                                          width: (86 * 0.01 * 100),
                                          height: 7,
                                          decoration: BoxDecoration(
                                              color: doneColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
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
                                                margin:
                                                    EdgeInsets.only(left: 12),
                                                width: 20,
                                                height: 20,
                                                decoration: new BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          // '${projects[index]!["background"]}'),
                                                          'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                      fit: BoxFit.cover),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                            Spacer(),
                            Container(
                                width: 150,
                                height: 160,
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 12, bottom: 12),
                                decoration: BoxDecoration(
                                    color: purpleLight,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        'Oct 25,2021',
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 86,
                                      child: Text(
                                        'Design Logo Fresh',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Container(
                                      width: 119,
                                      child: Text(
                                        'Design logo beverage store which name is...',
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    Stack(
                                      children: [
                                        Container(
                                          width: 86,
                                          height: 7,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                        Container(
                                          width: (86 * 0.01 * 35),
                                          height: 7,
                                          decoration: BoxDecoration(
                                              color: todoColor,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                width: 20,
                                                height: 20,
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
                                                margin:
                                                    EdgeInsets.only(left: 12),
                                                width: 20,
                                                height: 20,
                                                decoration: new BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          // '${projects[index]!["background"]}'),
                                                          'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                      fit: BoxFit.cover),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ])),
                          SizedBox(height: 16),
                          Container(
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                Container(
                                    width: 150,
                                    height: 160,
                                    padding: EdgeInsets.only(
                                        top: 16,
                                        left: 16,
                                        right: 12,
                                        bottom: 12),
                                    decoration: BoxDecoration(
                                        color: purpleLight,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Oct 26,2021',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: 86,
                                          child: Text(
                                            'Design Logo Hahaha',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: 119,
                                          child: Text(
                                            'Design logo food shop which name is...',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Stack(
                                          children: [
                                            Container(
                                              width: 86,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            Container(
                                              width: (86 * 0.01 * 65),
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  color: todoColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                                        left: 12),
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                Spacer(),
                                Container(
                                    width: 150,
                                    height: 160,
                                    padding: EdgeInsets.only(
                                        top: 16,
                                        left: 16,
                                        right: 12,
                                        bottom: 12),
                                    decoration: BoxDecoration(
                                        color: purpleLight,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12))),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            'Oct 26,2021',
                                            style: TextStyle(
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: 119,
                                          child: Text(
                                            'Design Logo Techi',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Container(
                                          width: 119,
                                          child: Text(
                                            'Design logo technology store which name is...',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontFamily: 'Poppins',
                                              color: black,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 12),
                                        Stack(
                                          children: [
                                            Container(
                                              width: 86,
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                            Container(
                                              width: (86 * 0.01 * 0),
                                              height: 7,
                                              decoration: BoxDecoration(
                                                  color: pendingColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10))),
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
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
                                                        left: 12),
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
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              ])),
                          SizedBox(height: 96),
                        ],
                      ),
                      // ListView(
                      //   children:projectcards.map((e)){
                      //   return Container();

                      //   }).toL
                      // )
                    ]
                  )
                )
              ],
            )
        )
    );
  }
}

class ProjectCardInfo {
  late String deadline;
  late String projectName;
  late String description;
  late bool isActive;
  ProjectCardInfo(
      {required String deadline,
      required String description,
      required String projectName});
}
