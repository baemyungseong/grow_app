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

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

class projectEditingScreen extends StatefulWidget {
  String uid;

  projectEditingScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _projectEditingScreenState createState() => _projectEditingScreenState(uid);
}

class _projectEditingScreenState extends State<projectEditingScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  int selected = 0;

  bool? haveDeadline = true;

  late DateTime selectDate = DateTime.now();

  _projectEditingScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> nameFormKey = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  GlobalKey<FormState> descriptionFormKey = GlobalKey<FormState>();

  var taskcollections = FirebaseFirestore.instance.collection('users');

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
                        Navigator.pop(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                projectManagementScreen(required, uid: uid),
                          ),
                        );
                      },
                      child: Text(
                        "Save",
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: purpleMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      )),
                )
              ]),
              SizedBox(height: 18),
              Container(
                padding: EdgeInsets.only(left: 28, right: 28),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Project Name",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20.0,
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Form(
                                    key: nameFormKey,
                                    child: Container(
                                      width: 319,
                                      height: 48,
                                      padding:
                                          EdgeInsets.only(left: 24, right: 24),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: purpleLight),
                                      alignment: Alignment.topCenter,
                                      child: TextFormField(
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w400),
                                          controller: nameController,
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
                                            border: InputBorder.none,
                                            hintText: "Design Logo Foody",
                                            hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                color: Color(0xFF666666),
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ),
                                  ),
                                ),
                              ]),
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
                                    "Description",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20.0,
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Form(
                                    key: descriptionFormKey,
                                    child: Container(
                                      width: 319,
                                      height: 48,
                                      padding:
                                          EdgeInsets.only(left: 24, right: 24),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: purpleLight),
                                      alignment: Alignment.topCenter,
                                      child: TextFormField(
                                          style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontSize: 14,
                                              color: black,
                                              fontWeight: FontWeight.w400),
                                          controller: descriptionController,
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
                                            border: InputBorder.none,
                                            hintText:
                                                "A digital Agency building functional...",
                                            hintStyle: TextStyle(
                                                fontFamily: 'Poppins',
                                                fontSize: 14,
                                                color: Color(0xFF666666),
                                                fontWeight: FontWeight.w400),
                                          )),
                                    ),
                                  ),
                                ),
                              ]),
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
                                    "Deadline",
                                    style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 20.0,
                                        color: black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 12),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () async {
                                          String category = "task";
                                          DateTime? dt = await datePickerDialog(context, selectDate, category);
                                          if (dt != null) {
                                            selectDate = dt;
                                            setState(() {
                                              haveDeadline = true;
                                              haveDeadline != haveDeadline;
                                              selectDate != selectDate;
                                            });
                                          }
                                          print(haveDeadline);
                                          print(selectDate);
                                        },
                                        child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          duration: Duration(milliseconds: 300),
                                          height: 48,
                                          width: 180,
                                          decoration: BoxDecoration(
                                            color: (haveDeadline == true) ? purpleLight : white,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              SizedBox(width: 12),
                                              Container(
                                                padding: EdgeInsets.zero,
                                                alignment: Alignment.center,
                                                child: Icon(Iconsax.calendar_1,
                                                  size: 16, color: greyDark
                                                )
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                // "12 November, 2021",
                                                "${DateFormat('yMMMMd').format(selectDate)}",
                                                // "${selectDate.day} ${selectDate.month}, ${selectDate.year}",
                                                style: TextStyle(
                                                  color: greyDark,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(width: 4)
                                            ],
                                          )
                                        ),
                                      )
                                    ),
                                    Spacer(),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: ()  {
                                          setState(() {
                                            haveDeadline = false;
                                            haveDeadline != haveDeadline;
                                          });
                                          print(haveDeadline);
                                          print(selectDate);
                                        },
                                        child: AnimatedContainer(
                                          alignment: Alignment.center,
                                          duration: Duration(milliseconds: 300),
                                          height: 48,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            color: (haveDeadline == true) ? white : purpleLight,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              SizedBox(width: 8),
                                              Container(
                                                padding: EdgeInsets.zero,
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  (haveDeadline == true) ? Iconsax.cd : Iconsax.tick_circle,
                                                  size: 16, color: greyDark
                                                )
                                              ),
                                              SizedBox(width: 8),
                                              Text(
                                                "No Deadline",
                                                style: TextStyle(
                                                  color: greyDark,
                                                  fontFamily: 'Poppins',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14,
                                                ),
                                              ),
                                              SizedBox(width: 4),
                                            ],
                                          )
                                        ),
                                      )
                                    ),
                                  ]
                                )
                              ]
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Assignee",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 20.0,
                                    color: black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 12),
                            Container(
                                width: 319,
                                padding: EdgeInsets.only(
                                    top: 24,
                                    left: 20,
                                    right: 20,
                                    bottom: 24),
                                decoration: BoxDecoration(
                                  color: purpleLight,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ListView.builder(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
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
                                                          Radius.circular(
                                                              8),
                                                      topRight:
                                                          Radius.circular(
                                                              8))
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
                                                  decoration:
                                                      new BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-2.fna.fbcdn.net/v/t1.6435-9/190035792_1051142615293798_577040670142118185_n.jpg?_nc_cat=100&ccb=1-5&_nc_sid=8bfeb9&_nc_ohc=1lB6NFX2w18AX-F1XX7&_nc_oc=AQkI-rgkX-fD7YGF3SqO8DG3EKUML4UyBDeaaKuTMD4VGaXQyiEjcX0Q3kUjtBKiIaM&tn=sOlpIfqnwCajxrnw&_nc_ht=scontent.fvca1-2.fna&oh=00_AT8lDJAVXKJ2EMEaFm9SlBJJkXuSfX2SqF9c56j1QOZXuA&oe=61DC63D7'),
                                                        fit: BoxFit.cover),
                                                    shape:
                                                        BoxShape.rectangle,
                                                  ),
                                                ),
                                                SizedBox(width: 16),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center,
                                                  children: <Widget>[
                                                    Container(
                                                        alignment: Alignment
                                                            .topLeft,
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
                                                            style:
                                                                TextStyle(
                                                              fontSize: 8,
                                                              fontFamily:
                                                                  'Poppins',
                                                              color:
                                                                  greyDark,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ))),
                                                  ],
                                                ),
                                                Spacer(),
                                                (index == 0) ? Container(
                                                  alignment: Alignment.center,
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                        image: AssetImage(leaderStar)),
                                                  ),
                                                ) : Container(),
                                                SizedBox(width: 16)
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      Container(
                                          alignment: Alignment.center,
                                          child: GestureDetector(
                                            onTap: () =>
                                                addAssigneeDialog(context),
                                            child: AnimatedContainer(
                                                alignment:
                                                    Alignment.centerLeft,
                                                duration: Duration(
                                                    milliseconds: 300),
                                                height: 48,
                                                width: 280,
                                                decoration: BoxDecoration(
                                                  color: purpleMain,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft: Radius
                                                              .circular(8),
                                                          bottomRight:
                                                              Radius
                                                                  .circular(
                                                                      8)),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                  children: [
                                                    SizedBox(width: 21),
                                                    Container(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        alignment: Alignment
                                                            .center,
                                                        child: Icon(
                                                            Iconsax.add,
                                                            size: 20,
                                                            color: white)),
                                                    SizedBox(width: 21),
                                                    Text(
                                                      "New Assignee",
                                                      style: TextStyle(
                                                        color: white,
                                                        fontFamily:
                                                            'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 12,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ))
                                    ]))
                          ]),
                      SizedBox(height: 24),
                    ]),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
