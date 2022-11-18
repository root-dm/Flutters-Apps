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

  Widget customcard2(String langname, String imagepath, String route) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        child: Card(
          //το wdiget Card
          color: Colors.white,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            iconColor: Colors.black,
            leading: Image(
              width: 40, //να γεμιζει η εικονα τον χωρο
              image: AssetImage(imagepath), //δυναμικο path εικονας
            ),
            title: Text(
              langname,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing: ElevatedButton(
              onPressed: () {},
              child: Icon(Icons.arrow_forward, color: Colors.blue),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0))),
                padding: MaterialStateProperty.all(
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10)),
                backgroundColor: MaterialStateProperty.all(
                    Colors.grey[300]), // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed))
                    return Colors.blue[100]; // <-- Splash color
                }),
              ),
            ),
          ),
        ),
        //  ),
      ),
    );
  }

  Widget customcard3(String langname, String imagepath, String route) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: InkWell(
        child: Card(
          //το wdiget Card
          color: Colors.white,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: ListTile(
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            iconColor: Colors.black,
            leading: Image(
              width: 40, //να γεμιζει η εικονα τον χωρο
              image: AssetImage(imagepath), //δυναμικο path εικονας
            ),
            title: Text(
              langname,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            trailing: Text(
              route,
              style: TextStyle(color: Colors.black),
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
      backgroundColor: Colors.grey[400],
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
                  color: Colors.black,
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
                    Colors.amberAccent, '/cardpageblood'),
                customcard("Activity", "6783", "steps", Icons.local_activity,
                    Colors.pink, '/cardpageactivity'),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '   YOUR DAILY INFORMATION',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              customcard2(
                  "Cardiotoxicity articles", 'assets/images/articles.png', '/'),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 30.0),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '   SCHEDULED ACTIVITIES',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              customcard3("Walking", 'assets/images/walking.png', '750 steps'),
              customcard3("Swimming", 'assets/images/swimming.png', '30 mins'),
            ],
          ),
        ],
      ),
    );
  }
}
