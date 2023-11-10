import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});
  static const colorList = [Colors.lightGreen, Colors.lightBlue];

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: StartScreen.colorList,
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
                onPressed: () {
                  setState(() {
                    print('SetState Triggered');
                  });
                },
                style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Profile Screen'),
              ),
            ],
          ),
        )
        // activeScreen == 'start-screen'
        // ? StartScreen(switchScreen)
        // : const QuestionsScreen(),

        );
  }
}
