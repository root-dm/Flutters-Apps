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
      Color color, IconData icon, String route) {
    return Padding(
      padding: EdgeInsets.all(5.0),
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
          color: color,
          elevation: 25.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 18,
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
                  padding: EdgeInsets.only(top: 10.0),
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

  Widget customcard2(String langname, String value) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        child: Card(
          //το wdiget Card
          color: Colors.white,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            width: 500,
            height: 100,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 5)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(langname),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                SizedBox(width: 25),
                Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(5.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 1.0, vertical: 1.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        primary: Colors.grey[300]),
                    child: Text(
                      ">",
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
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

  Widget customcard3(String value, String description, String src) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        child: Card(
          //το wdiget Card
          color: Colors.white,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            width: 500,
            height: 100,
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 20)),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(src),
                        width: 50,
                        height: 50,
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 10)),
                Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Padding(padding: EdgeInsets.only(left: 40)),
                Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    description,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
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
      backgroundColor: Colors.grey[250],
      body: Column(
        children: [
          Padding(padding: EdgeInsets.only(top: 45.0)),
          Text(
            "Welcome, World!",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                customcard("Heartbeat", "66", "bpm", Colors.red,
                    Icons.heat_pump_rounded, '/heartbeat'),
                customcard("Blood Pressure", '66/123', 'mm', Colors.blue,
                    Icons.bloodtype_sharp, '/bloodpressure'),
                customcard("Activity", "6783", "steps", Colors.red,
                    Icons.accessibility_sharp, '/activity'),
              ],
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Text(
            "YOUR DAILY INFORMATION",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          customcard2("assets/images/tasks.png", "Cardiotoxicity articles"),
          Padding(padding: EdgeInsets.only(top: 20.0)),
          Text(
            "SCHEDULED TASKS",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          customcard3("Walking", "750 steps", "assets/images/walking.png"),
          customcard3("Swimming", "30 mins", "assets/images/swimming.png"),
        ],
      ),
    );
  }
}
