import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Load SQL Lite',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Column(
          children: [Text('awd'), Text("adwwad")],
        ));
  }
}
