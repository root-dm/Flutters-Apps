import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamed(
          context, '/homepage'); // εδω χρησιμοποιουμε το named route που εχου-
      //με δηλωσει στην main.dart

      // Navigator.of(context).pushReplacement(MaterialPageRoute(
      //  builder: (context) => HomePage(),
      //));  //διαφορετικος τροπος χωρις named route. Απλα καλεις το widget που θες
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Image(
          fit: BoxFit.contain, //να γεμιζει η εικονα τον χωρο
          image: AssetImage('assets/images/logo.png'), //δυναμικο path εικονας
        ),
      ),
    );
  }
}
