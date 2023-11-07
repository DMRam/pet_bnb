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
      var url = Uri.parse('http://localhost:8080/client/all');

      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('Response: ${response.body}');
        return response.body;
      } else {
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
          return const CircularProgressIndicator();
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
