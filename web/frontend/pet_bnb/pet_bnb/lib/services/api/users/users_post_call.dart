import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class APICalls extends StatefulWidget {
  const APICalls({super.key});

  @override
  State<StatefulWidget> createState() {
    return _APICalls();
  }
}

class _APICalls extends State<APICalls> {
  Future<String> fetchData() async {
    try {

      print('IN FETCH ------');
      var url = Uri.parse('http://10.0.2.2:8080/client/all');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        // If server returns a 200 OK response, parse the JSON
        // You can use the `dart:convert` library to parse JSON
        // For example, if the response is a list of posts:
        // List<Post> posts = (json.decode(response.body) as List)
        //     .map((data) => Post.fromJson(data))
        //     .toList();

        print('Response: ${response.body}');
        return response.body;
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    return 'Error +++++ ';
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchData(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator(); // Return a loading indicator while waiting for data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Center(
            child: Text(snapshot.data!), // Display the fetched data
          );
        }
      },
    );
  }
}
