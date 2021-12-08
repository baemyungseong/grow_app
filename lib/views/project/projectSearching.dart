import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_app/views/project/projectManagement.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class projectSearchingScreen extends StatefulWidget {
  String uid;

  projectSearchingScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _projectSearchingScreenState createState() => _projectSearchingScreenState(uid);
}

class _projectSearchingScreenState extends State<projectSearchingScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  _projectSearchingScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  var taskcollections = FirebaseFirestore.instance.collection('users');
  late String task;

  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 62),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 28),
                      alignment: Alignment.center,
                      child: Form(
                        // key: formKey,
                        child: Container(
                          width: 291,
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
                    SizedBox(width: 8),
                    // Container(
                    //     alignment: Alignment.center,
                    //     child: GestureDetector(
                    //       // onTap: () {
                    //       //   Navigator.push(
                    //       //     context,
                    //       //     MaterialPageRoute(
                    //       //       builder: (context) =>
                    //       //           projectSearchingScreen(required, uid: uid),
                    //       //     ),
                    //       //   );
                    //       // },
                    //       child: AnimatedContainer(
                    //         alignment: Alignment.center,
                    //         duration: Duration(milliseconds: 300),
                    //         height: 32,
                    //         width: 32,
                    //         decoration: BoxDecoration(
                    //           color: purpleDark,
                    //           borderRadius: BorderRadius.circular(8),
                    //           boxShadow: [
                    //             BoxShadow(
                    //               color: black.withOpacity(0.25),
                    //               spreadRadius: 0,
                    //               blurRadius: 64,
                    //               offset: Offset(8, 8),
                    //             ),
                    //             BoxShadow(
                    //               color: black.withOpacity(0.2),
                    //               spreadRadius: 0,
                    //               blurRadius: 4,
                    //               offset: Offset(0, 4),
                    //             ),
                    //           ],
                    //         ),
                    //         child: Container(
                    //             padding: EdgeInsets.zero,
                    //             alignment: Alignment.center,
                    //             child: Icon(Iconsax.candle_2,
                    //                 size: 18, color: white)),
                    //       ),
                    //     )),
                    // SizedBox(width: 8),
                    IconButton(
                      padding: EdgeInsets.only(right: 20),
                      onPressed: () {
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  projectManagementScreen(required, uid: uid),
                            ));
                      },
                      icon: Icon(Iconsax.close_square, size: 28, color: black),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.only(left: appPaddingInApp, right: appPaddingInApp),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 6,
                    // itemCount: projects.length,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 169,
                          decoration: BoxDecoration(
                            // image: DecorationImage(
                            //     image: NetworkImage(
                            //         '${projects[index]!["background"]}'),
                            //     fit: BoxFit.cover),
                            image: DecorationImage(
                              image: NetworkImage('https://lh3.googleusercontent.com/2evG0c6oXWt5Wy9tqnUEbXdHtPNWzfWsCLpMAiBULIlsF_gDTJSh1b_USKQ49Kx530aVyA=s160'),
                              fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(16)),
                            boxShadow: [
                              BoxShadow(
                                color: purpleHShadow.withOpacity(0.6),
                                spreadRadius: -16,
                                blurRadius: 24,
                                offset: Offset(0, 28),
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(top: 16, bottom: 16.0),
                          child: Container(
                              padding: EdgeInsets.only(left: 24, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 235,
                                        child: Text(
                                          // "${projects[index]!["name"]}",
                                          "Medical Dashboard UI",
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              fontFamily: "Poppins",
                                              fontSize: 20.0,
                                              color: black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 12,
                                        height: 12,
                                        decoration: new BoxDecoration(
                                          // color: (projects[index]!["status"] ==
                                          //         "done")
                                          //     ? doneColor
                                          //     : ((projects[index]!["status"] ==
                                          //             "todo")
                                          //         ? todoColor
                                          //         : pendingColor),
                                          color: todoColor,
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 16),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Row(
                                          children: [
                                            Stack(
                                              children: [
                                                Container(
                                                  width: 32,
                                                  height: 32,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://lh3.googleusercontent.com/a-/AOh14GhaZE3tqUxagut4wGtdcGM8MXueJWinnDVLejhO=s1337'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 22),
                                                  width: 32,
                                                  height: 32,
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
                                                  margin:
                                                      EdgeInsets.only(left: 44),
                                                  width: 32,
                                                  height: 32,
                                                  decoration: new BoxDecoration(
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            // '${projects[index]!["background"]}'),
                                                            'https://scontent.fvca1-1.fna.fbcdn.net/v/t39.30808-6/244996278_2952087241710403_6324580891206192742_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=cIi4vovDQgAAX_ESENl&_nc_ht=scontent.fvca1-1.fna&oh=3a6523493bdd095f05631e86af33dcc0&oe=61B16FC0'),
                                                        fit: BoxFit.cover),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 24),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 16,
                                                width: 16,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          clockProject)),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                width: 137,
                                                child: Text(
                                                  // "${projects[index]!["deadline"]}",
                                                  "25 Mei 2021, 9PM",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12.0,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                height: 16,
                                                width: 16,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          taskProject)),
                                                ),
                                              ),
                                              SizedBox(width: 8),
                                              Container(
                                                width: 137,
                                                child: Text(
                                                  // "${projects[index]!["quantityTask"]} task",
                                                  "10 task",
                                                  overflow: TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                      fontFamily: "Poppins",
                                                      fontSize: 12.0,
                                                      color: black,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 18),
                                  Stack(
                                    children: [
                                      Container(
                                        width: 271,
                                        height: 9,
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                      ),
                                      Container(
                                        width: (271 * 0.01 *
                                            // (double.parse(
                                            //     projects[index]!["progress"]))
                                            60
                                        ),
                                        height: 9,
                                        decoration: BoxDecoration(
                                            // color: (projects[index]!["status"] ==
                                            //         "done")
                                            //     ? doneColor
                                            //     : ((projects[index]!["status"] ==
                                            //             "todo")
                                            //         ? todoColor
                                            //         : pendingColor),
                                            color: todoColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(16))),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(children: [
                                    Text(
                                      "Progress",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12.0,
                                          color: black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Spacer(),
                                    Text(
                                      // "${projects[index]!["progress"]}%",
                                      "60%",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 12.0,
                                          color: black,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ])
                                ],
                              )));
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
