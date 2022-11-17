// ignore_for_file: prefer_const_constructors
// @formatter:off
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget customcard(String langname, String value, String description,
      IconData icon, Color col, String route) {
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
          color: col,
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
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                      ),
                      Icon(
                        icon,
                        size: 25,
                        color: Colors.white,
                      ),
                      Text(
                        langname, //δυναμικο κειμενο εικονας
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5.0),
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
      backgroundColor: Colors.grey[800],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //padding top
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Container(
            padding: EdgeInsets.all(15.0),
            child: Text(
              'Hello World',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                customcard("Heartbeat", "66", "bpm", Icons.heart_broken,
                    Colors.blueAccent, '/cardpageheartbeat'),
                customcard("Blood Pressure", '66/123', 'mm', Icons.bloodtype,
                    Colors.amberAccent, '/cardpagejava'),
                customcard("Activity", "6783", "steps", Icons.local_activity,
                    Colors.pink, '/cardpagejavascript'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Column(
            children: [
              Text(
                'YOUR DAILY INFORMATION',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
