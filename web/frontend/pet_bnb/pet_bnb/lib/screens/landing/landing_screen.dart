import 'package:flutter/material.dart';
import 'package:pet_bnb/models/users/vet_profile.dart';
import 'package:pet_bnb/screens/login/start_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LandingScreen();
  }
}

class _LandingScreen extends State<LandingScreen> {
  static const colorList = [Colors.lightGreen, Colors.lightBlue];

  var activeScreen = "start-screen";

  void switchScreen() {
    setState(() {
      activeScreen = 'profile-screen';
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: colorList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: activeScreen == 'start-screen'
            ? StartScreen(switchScreen)
            : const ProfileScreen(),
      )),
    );
  }
}
