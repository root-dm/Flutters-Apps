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

  Widget customcard(IconData iconn, String titlee, String nums, String desc,
      String route, Color colorr) {
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
          color: colorr,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            width: 170,
            child: Column(
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Center(
                    child: Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 10.0)),
                    Icon(
                      iconn,
                      size: 20,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        titlee, //δυναμικο κειμενο εικονας
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    nums,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white,
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(3.0),
                  child: Text(
                    desc,
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
        backgroundColor: Color.fromARGB(255, 222, 221, 221),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 25.0)),
            Text(
              'Hello Pattient',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
                color: Colors.black,
              ),
            ),
            Container(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  customcard(
                      Icons.heart_broken_sharp,
                      "Heartbeat",
                      "66",
                      "bpm",
                      '/cardpagepython',
                      Colors
                          .redAccent), //περναμε τιτλο και εικονα απο την λιστα
                  customcard(Icons.bloodtype, "Blood Pressure", "66/123",
                      "mmHg", '/cardpagepython', Colors.cyanAccent),
                  customcard(Icons.do_not_step, "Activity", "6783", "step",
                      '/cardpagepython', Colors.orangeAccent),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              'YOUR DAILY INFORMATION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.black54,
              ),
            ),
            FittedBox(
              //height: 200,
              //width: 8555,
              child: customcard(
                  Icons.heart_broken_sharp,
                  "Heartbeat",
                  "66",
                  "bpm",
                  '/cardpagepython',
                  Colors.redAccent), //περναμε τιτλο και εικονα απο την λιστα
            ),
            Text(
              'YOUR DAILY INFORMATION',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17.0,
                color: Colors.black54,
              ),
            ),
          ],
        ));
  }
}
