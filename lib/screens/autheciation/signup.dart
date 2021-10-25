import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:grow_app/constants/images.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpScreen> {
  final formKey = new GlobalKey<FormState>();
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
                      image: AssetImage(background), fit: BoxFit.cover),
                ),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        // alignment: Alignment.topRight,
                        child: Text(
                          "Sign Up to " + '\n' + "Work with us",
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Container(
                        alignment: Alignment.topRight,
                        child: Image(image: AssetImage(suExciting)),
                      ),
                    ],
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 35.0, right: 35.0),
                      child: Column(children: [
                        Container(
                          width: 300,
                          height: 50,
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Enter your email",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 14,
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
                              color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Enter your name",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 14,
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
                              color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Enter your phone numbers",
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 14,
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
                              color: Colors.white),
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Enter your password",
                                border: InputBorder.none,
                                suffixIcon: InkWell(
                                    onTap: _togglePasswordSignUp,
                                    child: Icon(Icons.visibility)),
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Poppins",
                                  fontSize: 14,
                                )),
                          ),
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100)),
                                child: new Checkbox(
                                  value: true,
                                  activeColor: Colors.white,
                                  onChanged: _activeCheckAccept,
                                ),
                              ),
                              Text(
                                'Accept terms & Conditions',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 260,
                          alignment: Alignment.topCenter,
                          child: GestureDetector(
                            onTap: () => controlSignUp(),
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
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                )),
                          ),
                        ),
                        SizedBox(height: 35),
                        Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "Or Sign up with",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'MontserratBold',
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
                                onTap: () => controlSignUpWithGoogle(),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(suGoogle)),
                                      borderRadius: BorderRadius.circular(35)),
                                ),
                              ),
                            ),
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
                                          image: AssetImage(suFacebook)),
                                      borderRadius: BorderRadius.circular(35)),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 12),
                                )),
                            Container(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Login here!",
                                  style: TextStyle(
                                      color: Color(0xff9857CB),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 12),
                                )),
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                            width: 134,
                            height: 5,
                            decoration: BoxDecoration(
                                color: Color(0xffACB8C2),
                                borderRadius: BorderRadius.circular(100))),
                      ]))
                ]))));
  }

  void _togglePasswordSignUp() {}

  void _activeCheckAccept(bool? value) {}
}

controlSignUpWithFacebook() {}

controlSignUpWithGoogle() {}

controlSignUp() {}
