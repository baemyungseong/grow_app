import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:grow_app/constants/images.dart';
import 'signin.dart';

class recoveryScreen extends StatefulWidget {
  _RePasswordPageState createState() => _RePasswordPageState();
}

class _RePasswordPageState extends State<recoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              decoration: BoxDecoration(color: Color(0xffF5F5F5)),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Image(image: AssetImage(rpSaly38)),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      'Recovery Password',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: Text(
                      ' Just enter the email address you’ve used to' +
                          '\n' +
                          'register with us and we’ll send you a reset link!',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    width: 300,
                    height: 50,
                    margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffF1E9F6)),
                    alignment: Alignment.topLeft,
                    // padding: EdgeInsets.only(left: 34),
                    child: TextFormField(
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
                  Container(
                    padding: EdgeInsets.only(right: 50),
                    alignment: Alignment.topRight,
                    child: Text(
                      'Instruction manual',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        color: Color(0xff6F7175),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 260,
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () => controlRePassword(),
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
                            "Recovery Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 18),
                          )),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    width: 260,
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () => controlRePassword(),
                      child: AnimatedContainer(
                        alignment: Alignment.center,
                        duration: Duration(milliseconds: 300),
                        height: 60,
                        width: 305,
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signinScreen()),
                              );
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Color(0xff9857CB),
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            )),
                        decoration: BoxDecoration(
                            // color: Colors.white,
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
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

controlRePassword() {}
