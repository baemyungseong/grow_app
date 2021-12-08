import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import views
import 'package:grow_app/views/project/projectManagement.dart';
import 'package:grow_app/views/profile/changingPassword.dart';
import 'package:grow_app/views/profile/profileCenter.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class loginDetailScreen extends StatefulWidget {
  String uid;

  loginDetailScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  loginDetailScreenState createState() => loginDetailScreenState(uid);
}

class loginDetailScreenState extends State<loginDetailScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  loginDetailScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');

  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> usernameFormKey = GlobalKey<FormState>();
  TextEditingController jobController = TextEditingController();
  GlobalKey<FormState> jobFormKey = GlobalKey<FormState>();
  TextEditingController phonenumberController = TextEditingController();
  GlobalKey<FormState> phonenumberFormKey = GlobalKey<FormState>();

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
          Container(
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
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => profileCenterScreen(required, uid: uid),
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
                      Container(
                        child: Text(
                          "Login Details",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 24.0,
                              color: black,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Container(
                            child: Text(
                              "User Name",
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
                              // key: formKey,
                              child: Container(
                                width: 319,
                                height: 48,
                                padding: EdgeInsets.only(left: 24, right: 24),
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
                                  controller: usernameController,
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
                                    hintText: "What are you looking for?",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Container(
                            child: Text(
                              "Date of Birth",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20.0,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 12),
                          
                        ]
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Container(
                            child: Text(
                              "Your Job",
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
                              key: jobFormKey,
                              child: Container(
                                width: 319,
                                height: 48,
                                padding: EdgeInsets.only(left: 24, right: 24),
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
                                  controller: jobController,
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
                                    hintText: "What are you looking for?",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Container(
                            child: Text(
                              "Phone Number",
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
                              key: phonenumberFormKey,
                              child: Container(
                                width: 319,
                                height: 48,
                                padding: EdgeInsets.only(left: 24, right: 24),
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
                                  controller: phonenumberController,
                                  keyboardType: TextInputType.phone,
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
                                    hintText: "What are you looking for?",
                                    hintStyle: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400
                                    ),
                                  )
                                ),
                              ),
                            ),
                          ),
                        ]
                      ),
                      SizedBox(height: 24),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start, 
                        children: [
                          Container(
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 20.0,
                                  color: black,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => changingPasswordScreen(required, uid: uid),
                                  ),
                                );
                              },
                              child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 56,
                                width: 256,
                                decoration: BoxDecoration(
                                  color: purpleMain,
                                  borderRadius: BorderRadius.circular(15),
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
                                      blurRadius: 64,
                                      offset: Offset(15, 15),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      child: Icon(Iconsax.edit_2,
                                        size: 24, color: white
                                      )
                                    ),
                                    SizedBox(width: 12),
                                    Text(
                                      "Change Password",
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(width: 4)
                                  ],
                                )
                              ),
                            )
                          )
                        ]
                      )
                    ]
                  ),
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}
