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

//import others
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';

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
                              height: 1.6),
                        ),
                        SizedBox(height: 24),
                        Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () => signOutUser().then((value) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            authenticationWrapper()),
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
                                  )),
                            )),
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
                                      top: BorderSide(
                                          width: 3, color: Color(0xff9857CB)),
                                      left: BorderSide(
                                          width: 3, color: Color(0xff9857CB)),
                                      right: BorderSide(
                                          width: 3, color: Color(0xff9857CB)),
                                      bottom: BorderSide(
                                          width: 3, color: Color(0xff9857CB)),
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
                                  )),
                            ))
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
                    )),
              ],
            ));
      });
}

addAssigneeDialog(BuildContext mContext) {
  return showDialog(
      context: mContext,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.all(28),
          backgroundColor: white,
          content: Container(
            width: 319,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), 
              color: white,
              boxShadow: [
                BoxShadow(
                  color: black.withOpacity(0.25),
                  spreadRadius: 0,
                  blurRadius: 4,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 28, left: 28),
                      alignment: Alignment.center,
                      child: Form(
                        // key: searchFormKey,
                        child: Container(
                          width: 230,
                          height: 36,
                          padding: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: whiteLight),
                          alignment: Alignment.topCenter,
                          child: TextFormField(
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: black,
                                fontWeight: FontWeight.w400,
                                height: 1.5
                              ),
                              // controller: searchController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Container(
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                      Icon(Iconsax.search_normal_1,
                                          size: 16, color: black)
                                    ])),
                                border: InputBorder.none,
                                hintText: "Search by entering email",
                                hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w400,
                                    height: 1.6
                                ),
                              )),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.only(top: 28),
                      onPressed: () {
                        // Navigator.pop(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) =>
                        //         projectManagementScreen(required, uid: uid),
                        //   )
                        // );
                      },
                      icon: Icon(Iconsax.close_square, size: 20, color: black),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 263,
                        height: 48,
                        decoration: BoxDecoration(
                          color: white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(width: 16),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: new BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      'Pan Cái Chaor',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Poppins',
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          height: 1.2),
                                    )),
                                Container(
                                    // alignment: Alignment.topLeft,
                                    child: Text('Project Director',
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontFamily: 'Poppins',
                                          color: greyDark,
                                          fontWeight: FontWeight.w400,
                                        ))),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, 
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        // onTap: () => logoutDialog(context),
                        child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 32,
                            width: 102,
                            decoration: BoxDecoration(
                              color: purpleMain,
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
                                  blurRadius: 64,
                                  offset: Offset(15, 15),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add",
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )),
                      )),
                  SizedBox(width: 8),
                  Container(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: AnimatedContainer(
                            alignment: Alignment.center,
                            duration: Duration(milliseconds: 300),
                            height: 32,
                            width: 102,
                            decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color: black.withOpacity(0.10),
                                  spreadRadius: 0,
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: greyDark,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )),
                      )
                    ),
                ]),
                SizedBox(height: 28)
              ],
            ),
          ),
        );
      });
}

datePickerDialog(BuildContext context, selectDate, category) {
  return showRoundedDatePicker(
    // customWeekDays: ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"],
    height: 320,
    context: context,
    fontFamily: "Poppins",
    theme: ThemeData(primarySwatch: Colors.deepPurple),
    // listDateDisabled: [
    //   DateTime.now().add(Duration(days: 1)),
    //   DateTime.now().add(Duration(days: 4)),
    //   DateTime.now().add(Duration(days: 6)),
    //   DateTime.now().add(Duration(days: 8)),
    //   DateTime.now().add(Duration(days: 10)),
    // ],
    initialDate: selectDate,
    // initialDate: DateTime(2022, 12, 17),
    firstDate: DateTime(1900),
    lastDate:  (category == "dob") ? DateTime.now() : DateTime(2050),
    // onTapActionButton:() {
    //   if()
    // },

    styleDatePicker: MaterialRoundedDatePickerStyle(
      //Section 1
      paddingDateYearHeader: EdgeInsets.all(8),
      backgroundHeader: purpleDark,
      textStyleDayButton: TextStyle(
          fontFamily: "Poppins",
          fontSize: 16,
          color: white,
          fontWeight: FontWeight.w500,
          height: 1.0),
      textStyleYearButton: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24,
        color: white,
        fontWeight: FontWeight.w500,
      ),

      //Section 2
      textStyleMonthYearHeader: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w600,
      ),
      backgroundHeaderMonth: Colors.deepPurple[400],
      paddingMonthHeader: EdgeInsets.only(top: 12, bottom: 12),
      sizeArrow: 24,
      colorArrowNext: white,
      colorArrowPrevious: white,
      // marginLeftArrowPrevious: 8,
      // marginTopArrowPrevious: 0,
      // marginTopArrowNext: 0,
      // marginRightArrowNext: 8,

      //Section 3
      paddingDatePicker: EdgeInsets.all(0),
      backgroundPicker: Colors.deepPurple[300],
      textStyleDayHeader: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w600,
      ),
      textStyleDayOnCalendar: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w400,
      ),
      textStyleDayOnCalendarSelected: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w600,
      ),

      decorationDateSelected: BoxDecoration(
        color: purpleMain, 
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: black.withOpacity(0.10),
            spreadRadius: 0,
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),

      textStyleDayOnCalendarDisabled: TextStyle(
        fontSize: 20, 
        color: white.withOpacity(0.1)
      ),

      textStyleCurrentDayOnCalendar: TextStyle(
        fontFamily: "Poppins",
        fontSize: 20,
        color: purpleMain,
        fontWeight: FontWeight.w700,
      ),

      //Section 4
      paddingActionBar: EdgeInsets.all(8),
      backgroundActionBar: Colors.deepPurple[300],
      textStyleButtonAction: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w600,
      ),
      textStyleButtonPositive: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w600,
      ),
      textStyleButtonNegative: TextStyle(
        fontFamily: "Poppins",
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w600,
      ),
    ),
    
    styleYearPicker: MaterialRoundedYearPickerStyle(
      textStyleYear: TextStyle(
        fontFamily: "Poppins",
        fontSize: 24, 
        color: Colors.white,
        fontWeight: FontWeight.w400
      ),
      textStyleYearSelected: TextStyle(
        fontFamily: "Poppins",
        fontSize: 48, 
        color: Colors.white, 
        fontWeight: FontWeight.w600
      ),
      heightYearRow: 80,
      backgroundPicker: Colors.deepPurple[400],
    )
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
