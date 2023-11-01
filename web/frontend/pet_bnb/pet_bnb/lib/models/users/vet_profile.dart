import 'package:flutter/material.dart';
import 'package:pet_bnb/services/api/users/users_get_call.dart';
import 'package:pet_bnb/services/util/future_builder.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileScreenState();
  }
}

class _ProfileScreenState extends State<ProfileScreen> {
  static const colorList = [Colors.lightGreen, Colors.lightBlue];

  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: colorList,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Profile Page'),
              UsersGetAPICall(),
            ],
          ),
        )
        // activeScreen == 'start-screen'
        // ? StartScreen(switchScreen)
        // : const QuestionsScreen(),
        );
  }
}
