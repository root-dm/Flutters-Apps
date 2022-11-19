// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var listImages = [
    //η λιστα με τις εικονες που θα εμφανισουμε
    'assets/images/py.png',
    'assets/images/java.png',
    'assets/images/js.png',
    'assets/images/cpp.png'
  ];

  Widget customcard(String langname, String imagepath, String route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
          //Navigator.pushName(context,route); διαφορετικη συνταξη για το πανω
          // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CardPage()));  διαφορετικη συνταξη για το απο πανω χωρις pageRoute

          //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>CardPage())); οταν καλειται ετσι σβηνει την Homepage απο στο stack και οταν πατησουμε επιστροφη παει στην προηγουμενη σελιδα απο το homepage δλδ στο SplashScreen
          //  Navigator.of(context).pushReplacementNamed(routePage); //το ιδιο με το απο πανω σε διαφορετικη συνταξη και με namedRoutes

          print(
              'card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
        },
        child: Card(
          //το wdiget Card
          color: Colors.blue,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            child: Column(
              children: [
                Center(
                  child: Text(
                    langname, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    "Python is one of the most popular and fastest programming language in the last decade......",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
        //  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Container cards"),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: 350,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            customcard("Python", listImages[0],
                '/cardpagepython'), //περναμε τιτλο και εικονα απο την λιστα
            customcard("Java", listImages[1], '/cardpagejava'),
            customcard("JavaScript", listImages[2], '/cardpagejavascript'),
            customcard("C++", listImages[3], '/cardpagecpp'),
          ],
        ),
      ),
    );
  }
}
