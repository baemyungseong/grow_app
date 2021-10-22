import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grow_app/models/slider.dart';
import 'package:grow_app/screens/onboarding.dart';
import 'package:grow_app/screens/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

int initScreen = 0;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = (preferences.getInt('initScreen') ?? 0);
  await preferences.setInt('initScreen', 1);
  runApp(GrowApp());
}

class GrowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dialogBackgroundColor: Colors.white,
        primarySwatch: Colors.grey,
        cardColor: Colors.white70,
        accentColor: Colors.white,
      ),
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboard' : 'signin',
      routes: {
        'onboard': (context) => onboardingScreen(),
        'signin': (context) => signinScreen(),
      },
    );
  }
}
