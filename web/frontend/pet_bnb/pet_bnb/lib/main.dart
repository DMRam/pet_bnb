import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/providers/app_provider.dart';
import 'package:pet_bnb/configuration/presentation/widgets/bottom_tab_nav.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MyAppProvider())],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: MyNavigationBottom()),
    );
  }
}
