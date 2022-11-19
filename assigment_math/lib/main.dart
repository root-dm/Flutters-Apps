import 'package:flutter/material.dart';
import './home.dart';
import './cardpage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Multiple screens',
    initialRoute: '/homepage',
    routes: {
      '/': (context) => MyApp(), //οριζουμε τα μονοπατια NamedRoutes
      
      '/homepage': (context) => HomePage(),
      '/cardpagepython': (context) => CardPagePython(),
      '/cardpagejava': (context) => CardPageJava(),
      '/cardpagecpp': (context) => CardPageCpp(),
      '/cardpagejavascript': (context) => CardPageJavascript(),
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
