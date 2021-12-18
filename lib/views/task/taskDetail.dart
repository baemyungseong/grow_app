import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import widgets
import 'package:grow_app/views/widget/dialogWidget.dart';

//import views
import 'package:grow_app/views/project/projectManagement.dart';
import 'package:grow_app/views/project/circleProgressProject.dart';
import 'package:grow_app/views/project/projectEditing.dart';
import 'package:grow_app/views/task/taskCreating.dart';
import 'package:grow_app/views/task/taskEditing.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:custom_check_box/custom_check_box.dart';

class taskDetailScreen extends StatefulWidget {
  String uid;

  taskDetailScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _taskDetailScreenState createState() => _taskDetailScreenState(uid);
}

class _taskDetailScreenState extends State<taskDetailScreen>
    with SingleTickerProviderStateMixin {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  bool checkBoxValue = false;

  _taskDetailScreenState(uid);

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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 64),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
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
                            builder: (context) => taskEditingScreen(required, uid: uid),
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
                      )),
                )
              ]),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.only(left: 28, right: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "Create new blog post",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 24.0,
                            color: black,
                            fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      Container(
                        child: Text(
                          "In Progress",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 16.0,
                            color: yellowDark,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Stack(
                        children: [
                          Container(
                            width: 319,
                            height: 9,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.25),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: (271 * 0.01 *
                                // (double.parse(projects[index]!["progress"]))
                                70),
                            height: 9,
                            decoration: BoxDecoration(
                                // color: (projects[index]!["status"] == "done")
                                //     ? doneColor
                                //     : ((projects[index]!["status"] == "todo")
                                //         ? todoColor
                                //         : pendingColor),
                                boxShadow: [
                                  BoxShadow(
                                    color: black.withOpacity(0.25),
                                    spreadRadius: 0,
                                    blurRadius: 8,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                                color: yellowDark,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 319,
                        height: 48,
                        padding: EdgeInsets.only(
                            top: 8, left: 16, bottom: 8, right: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: purpleLight),
                        alignment: Alignment.center,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Icon(Iconsax.notification_1,
                                    size: 20, color: purpleMain),
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
                                            color: black),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ]
                        ),
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Overview",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20.0,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            child: Text(
                              "Create an article to welcome customers to the new branch of the store",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12.0,
                                color: greyDark,
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Assigned",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20.0,
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                                      builder: (context) =>
                                                          projectEditingScreen(
                                                              required,
                                                              uid: uid),
                                                    ),
                                                  );
                                                },
                                                child: AnimatedContainer(
                                                  alignment: Alignment.center,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  child: DottedBorder(
                                                    child: Container(
                                                      width: 36,
                                                      height: 36,
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors.white,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Icon(Iconsax.add,
                                                            size: 24,
                                                            color: greyDark),
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
                      SizedBox(height: 32),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Task Status",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20.0,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                              width: 319,
                              padding: EdgeInsets.only(
                                  top: 24, left: 20, right: 20, bottom: 24),
                              decoration: BoxDecoration(
                                color: purpleLight,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  children: [
                                    ListView.builder(
                                      physics: const AlwaysScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: 4,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: 280,
                                          height: 48,
                                          decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: (index == 0)
                                                ? BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(8),
                                                    topRight:
                                                        Radius.circular(8))
                                                : BorderRadius.all(
                                                    Radius.circular(0)),
                                            border: (index == 2)
                                                ? Border()
                                                : Border(
                                                    top: BorderSide(
                                                        width: 0.1,
                                                        color: greyDark),
                                                    left: BorderSide(
                                                        width: 0.1,
                                                        color: greyDark),
                                                    right: BorderSide(
                                                        width: 0.1,
                                                        color: greyDark),
                                                    bottom: BorderSide(
                                                        width: 0.1,
                                                        color: greyDark),
                                                  ),
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              SizedBox(width: 16),
                                              Container(
                                                width: 30,
                                                height: 30,
                                                decoration: new BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(8)),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          // '${projects[index]!["background"]}'),
                                                          'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                      fit: BoxFit.cover),
                                                  shape: BoxShape.rectangle,
                                                ),
                                              ),
                                              SizedBox(width: 16),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                      alignment:
                                                          Alignment.topLeft,
                                                      child: Text(
                                                        'Pan Cái Chaor',
                                                        style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                            height: 1.2),
                                                      )),
                                                  Container(
                                                      // alignment: Alignment.topLeft,
                                                      child: Text(
                                                          'Project Director',
                                                          style: TextStyle(
                                                            fontSize: 8,
                                                            fontFamily:
                                                                'Poppins',
                                                            color: greyDark,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400,
                                                          ))),
                                                ],
                                              ),
                                              Spacer(),
                                              Container(
                                                // padding: const EdgeInsets.only(right: 23.0),
                                                alignment: Alignment.topRight,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: new CustomCheckBox(
                                                    value: checkBoxValue,
                                                    shouldShowBorder: true,
                                                    borderColor: purpleHide,
                                                    checkedFillColor:
                                                        purpleHide,
                                                    checkedIconColor: white,
                                                    borderRadius: 4,
                                                    borderWidth: 1.5,
                                                    checkBoxSize: 16,
                                                    // onChanged: _activeCheckAccept,
                                                    onChanged:
                                                        (bool newValue) {
                                                      setState(() {
                                                        checkBoxValue =
                                                            newValue;
                                                      });
                                                    }
                                                ),
                                              ),
                                              SizedBox(width: 2)
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ]
                              )
                          )
                        ]
                      ),
                    ]
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
