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
      '/homepage': (context) => HomePage(),
      '/splashscreen': (context) => SplashScreen(),
      '/cardpageheartbeat': (context) => CardPageHeartbeat(),
      '/cardpageblood': (context) => CardPageBlood(),
      '/cardpageactivity': (context) => CardPageActivity(),
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
