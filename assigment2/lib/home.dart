// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          color: Color.fromARGB(255, 136, 105, 246),
          elevation: 10.0, //η σκια που θελουμε να φαινεται
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ), //στρογγυλοποιηση γωνιών της κάρτας
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0), //συμμετρικη αποσταση στον καθετο αξονα
                  child: Material(
                    //χρησιμοποιουμε το material για την σκιαση κτλ
                    elevation: 5.0, //σκια
                    borderRadius: BorderRadius.circular(
                        100), //για να γινει στρογγυλο το container που περιεχει την εικονα
                    child: Container(
                      height:
                          200, //χρειαζονται για να φανει η στρογγυλοποιηση του Material αλλιως η εικονα ειναι μεγαλυτερη και δεν φαινεται (στο συγκεκριμενο παραδειγμα)
                      width: 200,
                      child: ClipOval(
                        //κοβει την εικονα και την κανει στρογγυλη

                        child: Image(
                          fit: BoxFit.contain, //να γεμιζει η εικονα τον χωρο
                          image: AssetImage(imagepath), //δυναμικο path εικονας
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    langname, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
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
        title: Text("Depression CBT"),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 136, 105, 246),
      ),
      body: ListView(
        children: [
          customcard(
              "Suggestions", 'assets/images/suggestion.png', '/suggestions'),
          customcard(
              "Questionnaire", 'assets/images/que.png', '/questionnaire'),
        ],
      ),
    );
  }
}
