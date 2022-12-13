import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyHTTPWidget());
}

class MyHTTPWidget extends StatefulWidget {
  const MyHTTPWidget({super.key});

  @override
  State<MyHTTPWidget> createState() => _MyHTTPWidgetState();
}

class _MyHTTPWidgetState extends State<MyHTTPWidget> {
  final String url = 'https://swapi.dev/api/people/1/';
  List data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getJsonData();
  }

  void getJsonData() {
    http.get(
      Uri.parse(Uri.encodeFull(url)),
      headers: {"Accept": "application/json"},
    ).then((response) {
      var dataConvertedToJSON = json.decode(response.body);
      data = dataConvertedToJSON['results'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: data.isEmpty ? 0 : data.length,
        itemBuilder: (context, index) {
          return Center(
            child: Card(
              child: Text(data[index]['name']),
            ),
          );
        },
      ),
    );
  }
}
