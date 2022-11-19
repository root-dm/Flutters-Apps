// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  Widget customcard2(String langname, String imagepath, String route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(route);
          //Navigator.pushName(context,route); διαφορετικη συνταξη για το πανω
          // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CardPage()));  διαφορετικη συνταξη για το απο πανω χωρις pageRoute

          //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>CardPage())); οταν καλειται ετσι σβηνει την Homepage απο στο stack και οταν πατησουμε επιστροφη παει στην προηγουμενη σελιδα απο το homepage δλδ στο SplashScreen
          //  Navigator.of(context).pushReplacementNamed(routePage); //το ιδιο με το απο πανω σε διαφορετικη συνταξη και με namedRoutes

          print(
              'card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
        },
        child: Card(
          //το wdiget Card
          color: Colors.white,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 15.0)),
                Image(
                  fit: BoxFit.contain, //να γεμιζει η εικονα τον χωρο
                  width: 50,
                  image: AssetImage(imagepath), //δυναμικο path εικονας
                ),
                SizedBox(
                  width: 50,
                ),
                Center(
                  child: Text(
                    langname, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                    padding: EdgeInsets.all(20.0),
                    child: ElevatedButton(
                        child: Text(">".toUpperCase(),
                            style: TextStyle(fontSize: 14)),
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.grey[300]),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ))),
                        onPressed: () => [])),
              ],
            ),
          ),
        ),
        //  ),
      ),
    );
  }

  Widget customcard3(String langname, String imagepath, String route) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed(route);
          //Navigator.pushName(context,route); διαφορετικη συνταξη για το πανω
          // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CardPage()));  διαφορετικη συνταξη για το απο πανω χωρις pageRoute

          //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>CardPage())); οταν καλειται ετσι σβηνει την Homepage απο στο stack και οταν πατησουμε επιστροφη παει στην προηγουμενη σελιδα απο το homepage δλδ στο SplashScreen
          //  Navigator.of(context).pushReplacementNamed(routePage); //το ιδιο με το απο πανω σε διαφορετικη συνταξη και με namedRoutes

          print(
              'card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
        },
        child: Card(
          //το wdiget Card
          color: Colors.white,
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            child: Row(
              children: [
                Padding(padding: EdgeInsets.only(left: 15.0)),
                Image(
                  fit: BoxFit.contain, //να γεμιζει η εικονα τον χωρο
                  width: 50,
                  image: AssetImage(imagepath), //δυναμικο path εικονας
                ),
                SizedBox(
                  width: 50,
                ),
                Center(
                  child: Text(
                    langname, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
                Text(route),
                SizedBox(
                  width: 15,
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
                      '/cardpageheartbeat',
                      Colors
                          .redAccent), //περναμε τιτλο και εικονα απο την λιστα
                  customcard(Icons.bloodtype, "Blood Pressure", "66/123",
                      "mmHg", '/cardpageblood', Colors.cyanAccent),
                  customcard(Icons.do_not_step, "Activity", "6783", "step",
                      '/cardpageactivity', Colors.orangeAccent),
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
              child: customcard2(
                "Cardiotoxicity articles",
                "assets/images/news.png",
                '/cardpagepython',
              ), //περναμε τιτλο και εικονα απο την λιστα
            ),
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
              child: customcard3(
                "Walking",
                "assets/images/walk.png",
                '750 steps',
              ), //περναμε τιτλο και εικονα απο την λιστα
            ),
            FittedBox(
              //height: 200,
              //width: 8555,
              child: customcard3(
                "Swimming",
                "assets/images/swim.png",
                '30 mins',
              ), //περναμε τιτλο και εικονα απο την λιστα
            ),
          ],
        ));
  }
}
