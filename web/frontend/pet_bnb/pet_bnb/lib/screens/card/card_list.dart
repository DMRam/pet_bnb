import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/widgets/card_info.dart';

class CardList extends StatelessWidget {
  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const CardInfo();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
