import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import screens
import 'package:grow_app/screens/autheciation/signin.dart';
import 'package:grow_app/screens/autheciation/termCondition.dart';

//import others
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:blur/blur.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:custom_check_box/custom_check_box.dart';

class signupScreen extends StatefulWidget {
  @override
  _signupPageState createState() => _signupPageState();
}

class _signupPageState extends State<signupScreen> {

  bool isHiddenPassword = true;

  final formKey = new GlobalKey<FormState>();

  final emailController = TextEditingController();

  late String email, password;

  bool checkBoxValue = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent),
      child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(backgroundOnboarding), fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(height: 58),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(top: 52, left: 37),
                        child: Text(
                          "Sign Up to " + '\n' + "Work with Us!",
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: title28,
                            fontWeight: FontWeight.w600,
                            color: white,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        child: Image.asset(atPhoneExciting, scale: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 19),
                  Container(
                    child: Column(
                        children: [
                        Form(
                          key: formKey,
                          child: Container(
                            width: 300,
                            height: 50,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: purpleLight
                            ),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: [AutofillHints.email],
                                validator: (email) =>
                                    email != null && !EmailValidator.validate(email)
                                        ? 'Enter a vaid email'
                                        : null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: content14,
                                    color: greyDark,
                                  ),
                                  hintText: "Enter your email",
                                )),
                          ),
                        ),
                        Form(
                          // key: formKey,
                          child: Container(
                            width: 300,
                            height: 50,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: purpleLight),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                                // controller: emailController,
                                keyboardType: TextInputType.name,
                                autofillHints: [AutofillHints.name],
                                // validator: (email) =>
                                //     email != null && !EmailValidator.validate(email)
                                //         ? 'Enter a vaid email'
                                //         : null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: content14,
                                    color: greyDark,
                                  ),
                                  hintText: "Enter your name",
                                )),
                          ),
                        ),
                        Form(
                          // key: formKey,
                          child: Container(
                            width: 300,
                            height: 50,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: purpleLight),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                                // controller: emailController,
                                keyboardType: TextInputType.phone,
                                autofillHints: [AutofillHints.telephoneNumber],
                                // validator: (email) =>
                                //     email != null && !EmailValidator.validate(email)
                                //         ? 'Enter a vaid email'
                                //         : null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: content14,
                                    color: greyDark,
                                  ),
                                  hintText: "Enter your phone numbers",
                                )),
                          ),
                        ),
                        Form(
                          // key: formKey,
                          child: Container(
                            width: 300,
                            height: 50,
                            margin: EdgeInsets.symmetric(vertical: 8),
                            padding:
                                EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: purpleLight),
                            alignment: Alignment.topLeft,
                            child: TextFormField(
                                obscureText: isHiddenPassword,
                                decoration: InputDecoration(
                                  suffixIcon: InkWell(
                                      onTap: _togglePasswordView,
                                      child: isHiddenPassword
                                          ? Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                  SvgPicture.asset(eyeVisibility,
                                                      color: greyDark,
                                                      height: 24,
                                                      width: 24)
                                                ])
                                          : Stack(
                                              alignment: Alignment.centerRight,
                                              children: [
                                                  SvgPicture.asset(eyeInvisibility,
                                                      color: greyDark,
                                                      height: 24,
                                                      width: 24)
                                                ])),
                                  border: InputBorder.none,
                                  hintText: "Enter your password",
                                  hintStyle: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: content14,
                                      color: greyDark),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 23.0),
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                                child: new CustomCheckBox(
                                  value: checkBoxValue,
                                  shouldShowBorder: true,
                                  borderColor: white,
                                  checkedFillColor: white,
                                  checkedIconColor: black,
                                  borderRadius: 4,
                                  borderWidth: 1.5,
                                  checkBoxSize: 16,
                                  // onChanged: _activeCheckAccept,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      checkBoxValue = newValue;
                                    });
                                  }
                                ),
                            ),
                            Container(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => conditionScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Accept terms & Conditions",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: suggestion12
                                    ),
                                  )
                                ),
                              )
                            ],
                        ),
                        SizedBox(height: 10),
                        Container(
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () => controlSignUp(),
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 54,
                                width: 260,
                                decoration: BoxDecoration(
                                    color: purpleDark,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                        color: white.withOpacity(0.1),
                                        spreadRadius: 0,
                                        blurRadius: 64,
                                        offset: Offset(15, 15), // changes position of shadow
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
                                  "Sign Up",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: textButton
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 34),
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "or sign up with",
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                color: greyLight,
                                fontSize: suggestion12
                            ),
                          )
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => controlSignUpWithGoogle(),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(googleLogoIcon)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => controlSignUpWithFacebook(),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(facebookLogoIcon)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: suggestion12
                                  ),
                                )
                            ),
                            Container(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pop(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => signinScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Login here!",
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        color: purpleDark,
                                        fontWeight: FontWeight.w600,
                                        fontSize: suggestion12),
                                  )),
                            )
                          ],
                        ),
                      ]
                    )
                  )
                ]
                )
            )
      )
    );
  }

  //Create function
  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  void _activeCheckAccept(bool? value) {}

  controlSignUpWithFacebook() {}
  controlSignUpWithGoogle() {}
  controlSignUp() {}
}
