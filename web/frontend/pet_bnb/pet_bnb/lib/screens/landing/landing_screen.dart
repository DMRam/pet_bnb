import 'package:flutter/material.dart';


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
    return const Text('Land page');
  }
}
