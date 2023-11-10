import 'package:flutter/material.dart';
import 'package:pet_bnb/screens/login/start_screen.dart';
import 'package:pet_bnb/screens/profile/profile_screen.dart';
import 'package:pet_bnb/services/api/users/users_get_call.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;
  String tittleForAppBar = '';

  void titleHandler(index) {
    if (index == 1) {
      tittleForAppBar = "Pet";
    } else if (index == 2) {
      tittleForAppBar = "Profile";
    } else {
      tittleForAppBar = 'Start';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tittleForAppBar),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          titleHandler(currentPageIndex);
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.school),
            icon: Icon(Icons.school_outlined),
            label: 'School',
          ),
        ],
      ),
      body: <Widget>[
        const StartScreen(),
        const UsersGetAPICall(),
        const MyProfileScreen(),
      ][currentPageIndex],
    );
  }
}
