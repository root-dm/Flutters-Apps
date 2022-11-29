import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Load local JSON file',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Column(
          children: [
            Text(DateFormat().format(DateTime.now())),
            Container(
              height: 200,
              child: FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString('data_repo/pizzaexample.json'),
                builder: ((context, snapshot) {
                  var newData = json.decode(snapshot.data.toString());
                  return ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text('Name: ' + newData[index]['name']),
                          Text('Name: ' +
                              newData[index]['reviews'][0]['score'].toString()),
                          // Text('Score: ' + newData[index]['reviews']),
                          // Text("Name: " + newData[index]['name']),
                          // Text("Height: " + newData[index]['height']),
                          // Text("Mass: " + newData[index]['mass']),
                          // Text("Hair Color: " + newData[index]['hair_color']),
                        ],
                      ));
                    },
                    itemCount: newData == null ? 0 : newData.length,
                  );
                }),
              ),
            ),
          ],
        ));
  }
}
