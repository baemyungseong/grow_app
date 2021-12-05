import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import views
import 'package:grow_app/views/wrapper/authenticationWrapper.dart';

//import controllers
import 'package:grow_app/controllers/authController.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

logoutDialog(BuildContext mContext) {
  return showDialog(
      context: mContext,
      builder: (context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            backgroundColor: Color(0xff607dd9),
            content: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 300,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 70, 10, 10),
                    child: Column(
                      children: [
                        Text(
                          "Do you want to sign out Grow?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 23),
                        ),
                        SizedBox(height: 30),
                        Container(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            // onTap: () => controlLogOut(context),
                            onTap: () => signOutUser().then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => authenticationWrapper()),
                                  (Route<dynamic> route) => false);
                            }),
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 45,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35)),
                                child: Text(
                                  "Sign Out",
                                  style: TextStyle(
                                      color: Color(0xff607dd9),
                                      fontFamily: 'Poppins',
                                      fontSize: 15),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 45,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(35)),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: Color(0xff607dd9),
                                      fontFamily: 'Poppins',
                                      fontSize: 15),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -40,
                    child: CircleAvatar(
                      backgroundColor: Colors.blue,
                      radius: 40,
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                        size: 50,
                      ),
                    )
                ),
              ],
            )
        );
      }
  );
}


// dialog(BuildContext Context) {
//   return showDialog(
//       context: Context,
//       builder: (context) {
//         return SimpleDialog(
//           title: Text("Favour Options",
//               style: TextStyle(
//                   color: Color(0xFF05268D), fontFamily: "MontserratBold")),
//           children: <Widget>[
//             SimpleDialogOption(
//               child: Text("Delete",
//                   style: TextStyle(
//                       color: Color(0xFF05268D),
//                       fontFamily: "MontserratRegular")),
//               // onPressed: () {
//               //   Navigator.pop(context);
//               //   removeUserPost();
//               // },
//             ),
//             SimpleDialogOption(
//               child: Text("Cancel",
//                   style: TextStyle(
//                       color: Color(0xFF05268D),
//                       fontFamily: "MontserratRegular")),
//               // onPressed: () => Navigator.pop(context)
//             ),
//           ],
//         );
//       }
//   );
// }
