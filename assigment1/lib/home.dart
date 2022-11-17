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

  Widget customcard(String langname, String value, String description,
      IconData icon, String route) {
    return Padding(
      padding: EdgeInsets.all(2.0),
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
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0), //συμμετρικη αποσταση στον καθετο αξονα
                ),
                Center(
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        langname, //δυναμικο κειμενο εικονας
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    description,
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //padding top
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'Hello World',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                customcard("Heartbeat", "66", "bpm", Icons.heart_broken,
                    '/cardpagepython'),
                customcard("Blood Pressure", '66/123', 'mm', Icons.bloodtype,
                    '/cardpagejava'),
                customcard("Activity", "6783", "steps", Icons.local_activity,
                    '/cardpagejavascript'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
