import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/widgets/image_bubble.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Add padding here
      child: Center(
        child: Material(
          elevation: 10,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: () {
              // Handle card press
              print('Card Pressed');
            },
            child: Ink(
              
              decoration: BoxDecoration(
                
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black12,
                    Colors.white10
                  ], // Adjust gradient colors
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: const SizedBox(
                width: 350,
                height: 150,
                child: Row(

                  children: [
                    Expanded(
                    
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(4.0),
                        child: SingleChildScrollView(

                            scrollDirection: Axis.horizontal,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ImageBubble(),
                                ImageBubble(),
                                ImageBubble(),
                                ImageBubble(),
                                ImageBubble(),
                              ],
                            )),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'This is the description textThis is the description text',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Price \n \u0024\u0024\u0024',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
