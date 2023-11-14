import 'package:dio/dio.dart';
import 'package:pet_bnb/infrastructure/models/yes_no_model.dart';

class ApiAnswer {
  final _dio = Dio();

  Future<YesNoModel> getAnswer() async {
    try {
      final response = await _dio.get('https://yesno.wtf/api');

      if (response.statusCode == 200) {
        final myModel = YesNoModel.fromJson(response.data);
        return myModel;
      } else {
        throw Exception('Failed to fetch data');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
