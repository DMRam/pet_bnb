import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/widgets/bottom_tab_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: NavigationExample(),
      ),
    );
  }
}
