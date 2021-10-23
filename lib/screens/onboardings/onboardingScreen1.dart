import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import screens
import 'package:grow_app/screens/onboardings/onboardingScreen2.dart';
import 'package:grow_app/screens/onboardings/onboardingScreen3.dart';

//import others
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class onboardingScreen1 extends StatelessWidget {
  const onboardingScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Change status bar color to white
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 60),
              Container(
                alignment: Alignment.topRight,
                child: Image.asset(obHandcalendar, scale: 1),
              ),
              SizedBox(height: 47),
              Container(
                padding: EdgeInsets.only(right: padding32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Manage Your Schedule',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: title32,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.right,
                        )),
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'We’re more than a application.' +
                              '\n' +
                              'Customize Grow to work the way you do.',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: content16,
                              color: white,
                              fontWeight: FontWeight.w400,
                              height: 1.6),
                          textAlign: TextAlign.right,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 43),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(obRectangledot, height: 8, width: 30),
                    SizedBox(width: 8),
                    SvgPicture.asset(obCircledot, height: 8, width: 8),
                    SizedBox(width: 8),
                    SvgPicture.asset(obCircledot, height: 8, width: 8),
                  ],
                ),
              ),
              SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  //action navigate to onboarding screen 2
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onboardingScreen2(),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 300),
                      height: 54,
                      width: 260,
                      decoration: BoxDecoration(
                        color: purpleDark,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: white.withOpacity(0.1),
                            spreadRadius: 0,
                            blurRadius: 64,
                            offset:
                                Offset(15, 15), // changes position of shadow
                          ),
                          BoxShadow(
                            color: white.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: Offset(8, 8), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Text(
                        "Get started",
                        style: TextStyle(
                            color: white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: textButton),
                      )),
                ),
              ),
              SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                child: GestureDetector(
                  //action navigate (skip) to onboarding screen 3
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => onboardingScreen3(),
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    alignment: Alignment.center,
                    duration: Duration(milliseconds: 300),
                    child:
                        SvgPicture.asset(outlineClose, height: 40, width: 40),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
