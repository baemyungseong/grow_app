import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

//import constants
import 'package:grow_app/constants/colors.dart';
import 'package:grow_app/constants/fonts.dart';
import 'package:grow_app/constants/images.dart';
import 'package:grow_app/constants/icons.dart';
import 'package:grow_app/constants/others.dart';

//import screens
import 'package:grow_app/screens/autheciation/signup.dart';
import 'package:grow_app/screens/autheciation/recoveryPassword.dart';

//import others
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:blur/blur.dart';

class signinScreen extends StatefulWidget {
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<signinScreen> {
  bool isHiddenPassword = true;

  final formKey = new GlobalKey<FormState>();

  final emailController = TextEditingController();

  late String email, password;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image(image: AssetImage(atSalySayhi)),
              ),
              Expanded(
                child: Container(
                    width: width,
                    decoration: BoxDecoration(
                      color: Color(0xffF5F5F5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(top: 26, left: 34),
                          child: Text('Sign In to' + '\n' + 'Govern Together!',
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                        SizedBox(height: 20),
                        Form(
                          key: formKey,
                          child: Container(
                            width: 300,
                            height: 50,
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffF1E9F6)),
                            alignment: Alignment.topLeft,
                            // padding: EdgeInsets.only(left: 34),
                            child: TextFormField(
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                autofillHints: [AutofillHints.email],
                                validator: (email) => email != null &&
                                        !EmailValidator.validate(email)
                                    ? 'Enter a vaid email'
                                    : null,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontFamily: 'Poppins'),
                                  hintText: "Enter your email",
                                )),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 300,
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffF1E9F6)),
                          alignment: Alignment.topLeft,
                          // padding: EdgeInsets.only(left: 34),
                          child: TextFormField(
                              obscureText: isHiddenPassword,
                              decoration: InputDecoration(
                                fillColor: Colors.black,
                                suffixIcon: InkWell(
                                    onTap: _togglePasswordView,
                                    child: Icon(isHiddenPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                border: InputBorder.none,
                                hintText: "Enter your password",
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    fontFamily: 'Poppins'),
                              )),
                        ),
                        Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.only(top: 10, right: 50),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => recoveryScreen()),
                                );
                              },
                              child: Text('Recovery password',
                                  style: TextStyle(
                                    color: Color(0xff6F7175),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )),
                        SizedBox(height: 30),
                        Container(
                          height: 50,
                          width: 260,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () => controlSignIn(),
                            child: AnimatedContainer(
                                alignment: Alignment.center,
                                duration: Duration(milliseconds: 300),
                                height: 60,
                                width: 305,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xffCBB2DF),
                                          blurRadius: 15,
                                          offset: Offset(-5, 10))
                                    ],
                                    color: Color(0xff9857CB),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18
                                  ),
                                )
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Or continute with",
                              style: TextStyle(
                                  color: Color(0xffAAAAAA),
                                  fontFamily: 'Poppins',
                                  fontSize: 12),
                            )),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => controlSignInWithGoogle(),
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
                            Container(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: () => controlSignInWithFacebook(),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(facebookLogoIcon)),
                                      borderRadius: BorderRadius.circular(35)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Don't have an account? ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Poppins',
                                      fontSize: 12),
                                )),
                            Container(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Register here!",
                                    style: TextStyle(
                                        color: Color(0xff9857CB),
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Poppins',
                                        fontSize: 12),
                                  )),
                            )
                          ],
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  controlSignIn() {
    final form = formKey.currentState!;
    if (form.validate()) {
      final email = emailController.text;
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          content: Text("Your email is $email"),
        ));
    }
  }

  //Create function
  controlSignInWithFacebook() {}
  controlSignInWithGoogle() {}
}
