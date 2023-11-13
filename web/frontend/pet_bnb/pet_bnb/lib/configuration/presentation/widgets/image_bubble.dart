import 'package:flutter/material.dart';

class ImageBubble extends StatelessWidget {
  const ImageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    return _ImageBubble();
  }
}

class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        child: Image.network(
          'https://yesno.wtf/assets/no/8-5e08abbe5aacd2cf531948145b787e9a.gif',
          width: size.width * 0.25,
          height: size.width * 0.25,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              width: size.width * 0.7,
              height: 150,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: const Text("Textoooo"),
            );
          },
        ),
      ),
    );
  }
}
