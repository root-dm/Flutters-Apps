import 'package:flutter/material.dart';
import './home.dart';
import './cardpage.dart';
import './splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Multiple screens',
    initialRoute: '/splashscreen',
    routes: {
      '/': (context) => MyApp(), //οριζουμε τα μονοπατια NamedRoutes
      '/splashscreen': (context) => SplashScreen(),
      '/homepage': (context) => HomePage(),
      '/cardpagequestionnaire': (context) => CardPageQuestionaire(),
      '/cardpagesuggestions': (context) => CardPageSuggestions(),
      '/post1': (context) => Post1(),
      '/post2': (context) => Post2(),
      '/post3': (context) => Post3(),
      '/post4': (context) => Post4(),
    },
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(''),
    );
  }
}
