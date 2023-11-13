import 'package:flutter/material.dart';

class MyScrollableRow extends StatelessWidget {
  const MyScrollableRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Add styling and spacing between buttons
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button click
                print('Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                shape: const StadiumBorder(),
              ),
              child: const Text('Vet'),
            ),
          ),
          const SizedBox(width: 16.0), // Adjust spacing as needed
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button click
                print('Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change button color
                shape: const StadiumBorder(),
              ),
              child: const Text('Products'),
            ),
          ),
          const SizedBox(width: 16.0), // Adjust spacing as needed
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button click
                print('Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green, // Change button color
                shape: const StadiumBorder(),
              ),
              child: const Text('Services'),
            ),
          ),
          const SizedBox(width: 16.0), // Adjust spacing as needed
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button click
                print('Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 175, 76, 76), // Change button color
                shape: const StadiumBorder(),
              ),
              child: const Text('Services'),
            ),
          ),
          const SizedBox(width: 16.0), // Adjust spacing as needed
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button click
                print('Button Clicked');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 157, 76, 175), // Change button color
                shape: const StadiumBorder(),
              ),
              child: const Text('Services'),
            ),
          ),
          // Add more buttons as needed
        ],
      ),
    );
  }
}
