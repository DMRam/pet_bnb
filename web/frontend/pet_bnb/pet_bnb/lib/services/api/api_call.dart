import 'package:http/http.dart' as http;


Future<void> fetchData() async {
  try {
    var url = Uri.parse('http://localhost:8080/client/all');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // If server returns a 200 OK response, parse the JSON
      // You can use the `dart:convert` library to parse JSON
      // For example, if the response is a list of posts:
      // List<Post> posts = (json.decode(response.body) as List)
      //     .map((data) => Post.fromJson(data))
      //     .toList();

      print('Response: ${response.body}');
      
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  } catch (e) {
    print('Error: $e');
  }
}
