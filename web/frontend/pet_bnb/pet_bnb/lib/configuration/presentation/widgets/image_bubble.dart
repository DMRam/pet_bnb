import 'package:flutter/material.dart';
import 'package:pet_bnb/configuration/presentation/providers/app_provider.dart';
import 'package:pet_bnb/configuration/presentation/widgets/my_image_widget.dart';
import 'package:pet_bnb/infrastructure/models/yes_no_model.dart';

class ImageBubble extends StatelessWidget {
  const ImageBubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final myAppProvider = MyAppProvider();

    // Fetch image data when this widget is built
    myAppProvider.fetchImageData();

    return FutureBuilder<YesNoModel>(
      future: myAppProvider.imageFromApi,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const RefreshProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error loading image: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data?.image == null) {
          return Text('No image data available');
        } else {
          // If data is available, display the image using the fetched URL
          final imageUrl = snapshot.data!.image;
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Row(
                  children: [
                    MyImageWidget(
                      imageUrl: imageUrl,
                      height: size.width * 0.20,
                      width: size.width * 0.15,
                      borderRadius: 5,
                      elevation: 10,
                    ),
                    
                  ],
                )),
          );
        }
      },
    );
  }
}
