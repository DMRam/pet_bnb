import 'package:flutter/material.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize:
                const Size.fromHeight(30.0), // Adjust the height as needed
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
              child: const Text(
                'Profile',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: const Center(
          child: Column(
            children: [
              Text('Profile Screen'),
            ],
          ),
        ));
  }
}
