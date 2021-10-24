import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import screens
import 'package:grow_app/screens/onboardings/onboardingScreen1.dart';
import 'package:grow_app/screens/onboardings/onboardingScreen2.dart';
import 'package:grow_app/screens/autheciation/signin.dart';

//import others
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class onboardingScreen3 extends StatelessWidget {
  const onboardingScreen3({Key? key}) : super(key: key);

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
          padding: EdgeInsets.all(38),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(background), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(height: 48),
              Container(
                alignment: Alignment.center,
                child: Image.asset(obDocumentfile, scale: 1),
              ),
              SizedBox(height: 32),
              Container(
                // padding: EdgeInsets.only(right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Team up without' + '\n' + 'the chaos',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: title32,
                            color: white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(height: 8),
                    Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Team up without the chaos.' + '\n' + 'Connect your teams, projects, and' + '\n' + 'docs in Grow - so you can bust silos' + '\n' + 'and move as one.',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: content16,
                              color: white,
                              fontWeight: FontWeight.w400,
                              height: 1.6),
                          textAlign: TextAlign.center,
                        )),
                  ],
                ),
              ),
              SizedBox(height: 55),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => onboardingScreen1(),
                          ),
                        );
                      },
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        child: SvgPicture.asset(obCircledot, height: 8, width: 8),
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
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
                        child: SvgPicture.asset(obCircledot, height: 8, width: 8),
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: white.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: Offset(1, 1), // changes position of shadow
                            ),
                            BoxShadow(
                              color: white.withOpacity(0.3),
                              blurRadius: 5,
                              offset: Offset(3, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: SvgPicture.asset(obRectangledot, height: 8, width: 30),
                      ),
                    ),
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
                        builder: (context) => signinScreen(),
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
                        "Close",
                        style: TextStyle(
                            color: white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: textButton),
                      )),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
