import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pet_bnb/models/users/client_profile.dart';

class UsersGetAPICall extends StatefulWidget {
  const UsersGetAPICall({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UsersGetAPICall();
  }
}

class _UsersGetAPICall extends State<UsersGetAPICall> {
  Future<List<Map<String, dynamic>>?> fetchData() async {
    try {
      print('IN FETCH ------');
      var url = Uri.parse('http://127.0.0.1:8080/client/all');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('IN IF ------');
        List<Map<String, dynamic>> clients =
            List<Map<String, dynamic>>.from(json.decode(response.body));
        return clients;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize:
              const Size.fromHeight(30.0), // Adjust the height as needed
          child: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: const Text(
              'API',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
      body: Center(
        // Center the entire content
        child: FutureBuilder<List<Map<String, dynamic>>?>(
          future: fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<List<Map<String, dynamic>>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child:
                    CircularProgressIndicator(), // Center the loading indicator
              );
            } else if (snapshot.hasError || snapshot.data == null) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Column(
                        children: [
                          ClientClass(
                            snapshot.data![index]['name'],
                            snapshot.data![index]['lastName'],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
