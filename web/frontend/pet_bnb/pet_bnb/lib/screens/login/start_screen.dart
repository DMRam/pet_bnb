import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});
  static const colorList = [Colors.lightGreen, Colors.lightBlue];

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(30.0), // Adjust the height as needed
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: const Text(
              'Start Screen',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: colorList,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Landing Page'),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  style:
                      OutlinedButton.styleFrom(foregroundColor: Colors.white),
                  icon: const Icon(Icons.arrow_right_alt),
                  label: const Text('Profile Screen'),
                ),
              ],
            ),
          )
          // activeScreen == 'start-screen'
          // ? StartScreen(switchScreen)
          // : const QuestionsScreen(),
          ),
    );
  }
}
