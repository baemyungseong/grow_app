import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import views
import 'package:grow_app/views/projectManagement/projectCenter.dart';
import 'package:grow_app/views/projectManagement/projectCreating.dart';
import 'package:grow_app/views/projectManagement/projectSearching.dart';
import 'package:grow_app/views/profileManagement/notificationCenter.dart';

//import controllers
import 'package:grow_app/controllers/projectController.dart';

//import firebase
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grow_app/views/wrapper/navigationBar.dart';

//import others
import 'package:meta/meta.dart';
import 'package:iconsax/iconsax.dart';

class projectManagementScreen extends StatefulWidget {
  String uid;

  projectManagementScreen(Required required, {Key? key, required this.uid})
      : super(key: key);

  @override
  _projectManagementScreenState createState() =>
      _projectManagementScreenState(uid);
}

class _projectManagementScreenState extends State<projectManagementScreen> {
  // final String? uid = controllers.currentUserId;

  String uid = "";

  List<String> projectsList = [];
  List projectsDataList = [];
  List<Map<String, dynamic>?> projects = [];
  // bool isChangeProjectData = false;

  _projectManagementScreenState(uid);

  FirebaseAuth auth = FirebaseAuth.instance;

  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    final userid = user?.uid.toString();
    uid = userid!;
    print('The current uid is $uid');
    getProjectsDataList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getProjectsDataList() async {
    FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .snapshots()
        .listen((value) {
      projects.clear();
      value.data();
      print(value.data());
      value["projectsList"].forEach((id) async {
        projects.add(await getDataProject(id));
        if (mounted) setState(() {});
      });
    });
  }

  // isChangeProjectsData(id) async {
  //   await FirebaseFirestore.instance
  //       .collection("projects")
  //       .doc(id)
  //       .snapshots()
  //       .listen((value) {
  //     isChangeProjectData == true;
  //     print(isChangeProjectData);
  //   });
  //   return isChangeProjectData;
  // }

  Future<Map<String, dynamic>?> getDataProject(id) async {
    // var data;
    // await FirebaseFirestore.instance
    //     .collection('projects')
    //     .doc(id)
    //     .snapshots()
    //     .listen((value) {
    //   value.data();
    //   print(data);
    //   data = value.data();
    //   if (mounted) setState(() {});
    // });
    // return data;
    var data;
    await FirebaseFirestore.instance
        .collection('projects')
        .doc(id)
        .get()
        .then((value) {
      data = value.data();
      print(data);
    });
    return data;
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
                      IconButton(
                        padding: EdgeInsets.only(left: 28),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  navigationBar(required, uid: uid),
                            ),
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios, size: 28, color: black),
                      ),
                      Spacer(),
                      Container(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    projectSearchingScreen(required, uid: uid),
                              ),
                            );
                          },
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
                                child: Icon(
                                  Iconsax.search_normal_1,
                                  size: 18, 
                                  color: white
                                )
                              ),
                          ),
                        )
                      ),
                      SizedBox(width: 8),
                      Container(
                        padding: EdgeInsets.only(right: 28),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    notificationCenterScreen(required, uid: uid),
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
                                child: Icon(
                                  Iconsax.notification,
                                  size: 18, 
                                  color: white
                                )
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.only(left: 28),
                    child: Text(
                      "Projects",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 28.0,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.only(
                        left: appPaddingInApp, right: appPaddingInApp),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: projects.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 169,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        '${projects[index]!["background"]}'),
                                    fit: BoxFit.cover),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16))),
                            margin: EdgeInsets.only(top: 12, bottom: 12.0),
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
                                            "${projects[index]!["name"]}",
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
                                            color: (projects[index]!["status"] ==
                                                    "done")
                                                ? doneColor
                                                : ((projects[index]!["status"] ==
                                                        "todo")
                                                    ? todoColor
                                                    : pendingColor),
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
                                                    margin: EdgeInsets.only(left: 22),
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
                                                    margin: EdgeInsets.only(left: 44),
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
                                          mainAxisAlignment: MainAxisAlignment.start,
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
                                                            clockProject)
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Container(
                                                  width: 137,
                                                  child: Text(
                                                    "${projects[index]!["deadline"]}",
                                                    overflow: TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontFamily: "Poppins",
                                                        fontSize: 12.0,
                                                        color: black,
                                                        fontWeight: FontWeight.w500
                                                    ),
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
                                                            taskProject)
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 8),
                                                Container(
                                                  width: 137,
                                                  child: Text(
                                                    "${projects[index]!["quantityTask"]} task",
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
                                          width: (271 *
                                              0.01 *
                                              (double.parse(
                                                  projects[index]!["progress"]))),
                                          height: 9,
                                          decoration: BoxDecoration(
                                              color: (projects[index]!["status"] ==
                                                      "done")
                                                  ? doneColor
                                                  : ((projects[index]!["status"] ==
                                                          "todo")
                                                      ? todoColor
                                                      : pendingColor),
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
                                        "${projects[index]!["progress"]}%",
                                        style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 12.0,
                                            color: black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ])
                                  ],
                                )
                            )
                        );
                      },
                    ),
                  ),
                ],
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
                              projectCreatingScreen(required, uid: uid),
                        ),
                      );
                    },
                    child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        height: 42,
                        width: 148,
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
                              child: Icon(Iconsax.add, size: 24, color: white)
                            ),
                            SizedBox(width: 4),
                            Text(
                              "New Project",
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
        )
    );
  }
}

// child: FutureBuilder<List<String>>(
//   future: getProjectsDataList(),
//   builder: (context, snapshot) {
//     if (snapshot.hasData) {
//       return ListView.builder(
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         itemCount: snapshot.data!.length,
//         itemBuilder: (context, index) {
//           return FutureBuilder(
//               future: getDataProject(snapshot.data![index]),
//               builder: (context, snap) {
//                 print(snap.data);
//                 return Container(
//                   decoration: BoxDecoration(
//                     color: Colors.purple,
//                     borderRadius: (index == 0)
//                         ? BorderRadius.only(
//                             topLeft: Radius.circular(16),
//                             topRight: Radius.circular(16))
//                         : ((index == snapshot.data!.length - 1)
//                             ? BorderRadius.only(
//                                 bottomLeft: Radius.circular(16),
//                                 bottomRight: Radius.circular(16))
//                             : BorderRadius.all(
//                                 Radius.circular(0))),
//                   ),
//                   margin: EdgeInsets.all(8.0),
//                   child: ListTile(
//                     title: Text(
//                       "",
//                       style: TextStyle(
//                         fontFamily: "Poppins",
//                         fontSize: 18.0,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 );
//               });
//         },
//       );
//     } else if (snapshot.hasError) {
//       return CircularProgressIndicator();
//     } else {
//       return CircularProgressIndicator();
//     }
//   },
// ),

// Container(
//   padding: EdgeInsets.only(left: appPadding, right: appPadding),
//   child: StreamBuilder<QuerySnapshot>(
//     stream: FirebaseFirestore.instance
//         .collection('users')
//         .doc(uid)
//         .collection('projects')
//         .snapshots(),
//     builder: (context, snapshot) {
//       if (snapshot.hasData) {
//         return ListView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           itemCount: snapshot.data!.docs.length,
//           itemBuilder: (context, index) {
//             DocumentSnapshot ds = snapshot.data!.docs[index];
//             print(snapshot.data!.docs.first['name']);
//             return Container(
//               decoration: BoxDecoration(
//                 color: Colors.purple,
//                 borderRadius: (index == 0)
//                     ? BorderRadius.only(
//                         topLeft: Radius.circular(16),
//                         topRight: Radius.circular(16))
//                     : ((index == snapshot.data!.docs.length - 1)
//                         ? BorderRadius.only(
//                             bottomLeft: Radius.circular(16),
//                             bottomRight: Radius.circular(16))
//                         : BorderRadius.all(Radius.circular(0))),
//               ),
//               margin: EdgeInsets.all(8.0),
//               child: ListTile(
//                 title: Text(
//                   ds['name'],
//                   style: TextStyle(
//                     fontFamily: "Poppins",
//                     fontSize: 18.0,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       } else if (snapshot.hasError) {
//         return CircularProgressIndicator();
//       } else {
//         return CircularProgressIndicator();
//       }
//     },
//   ),
// ),

// create project id
// String id = FirebaseFirestore.instance.collection("users").doc().id
// get document snapshot of project which have status field = todo
// await FirebaseFirestore.instance.collection("projects").where("status", isEqualTo: "todo").get().then((value) => null)
