import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/providers/app_provider.dart';
import 'package:pet_bnb/configuration/presentation/widgets/bottom_tab_nav.dart';
import 'package:provider/provider.dart';

class MyFloatingButton extends StatefulWidget {
  const MyFloatingButton({super.key});

  @override
  State<MyFloatingButton> createState() => _MyFloatingButtonState();
}

class _MyFloatingButtonState extends State<MyFloatingButton> {
  // The FAB's foregroundColor, backgroundColor, and shape
  static const List<(Color?, Color? background, ShapeBorder?)> customizations =
      <(Color?, Color?, ShapeBorder?)>[
    (null, null, null), // The FAB uses its default for null parameters.
    (null, Colors.green, null),
    (Colors.white, Colors.green, null),
    (Colors.white, Colors.green, CircleBorder()),
  ];
  int index = 0; // Selects the customization.

  @override
  Widget build(BuildContext context) {
    final appProvider = context.watch<MyAppProvider>();

    return FloatingActionButton(
      onPressed: () {
        appProvider.switchToMap();
        setState(() {
          index = (index + 1) % customizations.length;
        });
      },
      foregroundColor: customizations[index].$1,
      backgroundColor: customizations[index].$2,
      shape: customizations[index].$3,
      child: const Icon(Icons.navigation),
    );
  }
}
