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
import 'package:iconsax/iconsax.dart';

logoutDialog(BuildContext mContext) {
  return showDialog(
      context: mContext,
      builder: (context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            backgroundColor: purpleDark,
            content: Stack(
              overflow: Overflow.visible,
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 264,
                  width: 240,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
                    child: Column(
                      children: [
                        Text(
                          "Do you want to log" + '\n' + "out Grow?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              height: 1.6
                          ),
                        ),
                        SizedBox(height: 24),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () => signOutUser().then((value) {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => authenticationWrapper()),
                                  (Route<dynamic> route) => false);
                            }),
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              duration: Duration(milliseconds: 300),
                              height: 54,
                              width: 260,
                              decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(8),
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
                              child: Text(
                                  "Log out",
                                  style: TextStyle(
                                      color: purpleDark,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                              )
                            ),
                          )
                        ),
                        SizedBox(height: 16),
                        Container(
                          alignment: Alignment.center,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              duration: Duration(milliseconds: 300),
                              height: 54,
                              width: 260,
                              decoration: BoxDecoration(
                                color: purpleDark,
                                border: Border(
                                  top: BorderSide(width: 3, color: Color(0xff9857CB)),
                                  left: BorderSide(width: 3, color: Color(0xff9857CB)),
                                  right: BorderSide(width: 3, color: Color(0xff9857CB)),
                                  bottom: BorderSide(width: 3, color: Color(0xff9857CB)),
                                ),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                    BoxShadow(
                                      color: black.withOpacity(0.10),
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
                              child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      color: white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                              )
                            ),
                          )
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: -56,
                    child: Container(
                      child: CircleAvatar(
                        backgroundColor: purpleMain,
                        radius: 40,
                        child: Icon(
                          Iconsax.logout,
                          color: Colors.white,
                          size: 40,
                        ),
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
