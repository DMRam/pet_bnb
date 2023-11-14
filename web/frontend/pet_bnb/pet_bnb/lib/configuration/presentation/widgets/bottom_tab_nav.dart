import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/providers/app_provider.dart';
import 'package:pet_bnb/configuration/presentation/widgets/toggle_map_list_button.dart';
import 'package:pet_bnb/screens/login/start_screen.dart';
import 'package:pet_bnb/screens/profile/profile_screen.dart';
import 'package:pet_bnb/services/api/users/users_get_call.dart';
import 'package:provider/provider.dart';

class MyNavigationBottom extends StatefulWidget {
  const MyNavigationBottom({super.key});

  @override
  State<MyNavigationBottom> createState() => _MyNavigationBottomState();
}

class _MyNavigationBottomState extends State<MyNavigationBottom> {
  int currentPageIndex = 0;
  String tittleForAppBar = 'Start';

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

    final appProvider = context.watch<MyAppProvider>();

    appProvider.initialToMap;
    return Scaffold(
      appBar: AppBar(
        title: Text(tittleForAppBar),
        backgroundColor: Color.fromARGB(192, 96, 125, 139),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
          titleHandler(currentPageIndex);
        },
        indicatorColor: Color.fromARGB(192, 119, 129, 134),
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.pets_outlined),
            icon: Icon(Icons.pets_outlined),
            label: 'My Pet',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const StartScreen(),
        const UsersGetAPICall(),
        const MyProfileScreen(),
      ][appProvider.initialToMap? 1 : currentPageIndex],
      floatingActionButton: const MyFloatingButton(),
    );
  }
}
