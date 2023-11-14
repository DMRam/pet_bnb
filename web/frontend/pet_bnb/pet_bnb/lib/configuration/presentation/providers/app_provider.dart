import 'package:flutter/material.dart';
import 'package:pet_bnb/infrastructure/models/yes_no_model.dart';
import 'package:pet_bnb/configuration/helper/api_answer.dart';

class MyAppProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  late Future<YesNoModel> imageFromApi; // Late-initialized

  bool initialToMap = false;
  bool switchToMap() {
    initialToMap = !initialToMap; // Toggle true/false
    print("**********");
    print(initialToMap);
    notifyListeners();
    return initialToMap;
  }

  Future<void> fetchImageData() async {
    try {
      final apiAnswer = ApiAnswer(); // Create an instance of ApiAnswer
      imageFromApi = apiAnswer.getAnswer(); // Call the getAnswer method to fetch data from ApiAnswer Class
      notifyListeners();
    } catch (error) {
      print('Error fetching image data: $error');
      
    }
  }
}
