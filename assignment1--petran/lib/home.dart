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
            width: 170,
            child: Column(
              children: [
                Center(
                    child: Row(
                  children: [
                    Icon(
                      Icons.android,
                      size: 20,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        langname, //δυναμικο κειμενο εικονας
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
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
      body: Container(
        height: 220,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            customcard("Heartbeat", listImages[0],
                '/cardpagepython'), //περναμε τιτλο και εικονα απο την λιστα
            customcard("Blood pressure", listImages[1], '/cardpagejava'),
            customcard("Activity", listImages[2], '/cardpagejavascript'),
          ],
        ),
      ),
    );
  }
}
