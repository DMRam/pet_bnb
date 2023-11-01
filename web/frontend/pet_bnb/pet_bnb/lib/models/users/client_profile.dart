import 'package:flutter/material.dart';

class ClientClass extends StatefulWidget {
  final String name;
  final String lastName;

  ClientClass(this.name, this.lastName, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ClientClass();
  }
}

class _ClientClass extends State<ClientClass> {
  static const colorList = [Colors.lightGreen, Colors.lightBlue];

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(widget.name),
            Text(widget.lastName),
          ],
        ),
      ),
    );
  }
}
