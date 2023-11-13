import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/widgets/image_bubble.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: 30,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: SizedBox(
          width: 350,
          height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageBubble(),
              
            ],
          ),
        ),
      ),
    );
  }
}