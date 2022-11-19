import 'package:flutter/material.dart';

Widget customcard(String titleer, String titlee, String nums, String desc) {
  return Padding(
    padding: EdgeInsets.all(2.0),
    child: InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(route);
        //Navigator.pushName(context,route); διαφορετικη συνταξη για το πανω
        // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CardPage()));  διαφορετικη συνταξη για το απο πανω χωρις pageRoute

        //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>CardPage())); οταν καλειται ετσι σβηνει την Homepage απο στο stack και οταν πατησουμε επιστροφη παει στην προηγουμενη σελιδα απο το homepage δλδ στο SplashScreen
        //  Navigator.of(context).pushReplacementNamed(routePage); //το ιδιο με το απο πανω σε διαφορετικη συνταξη και με namedRoutes

        print('card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
      },
      child: Card(
        //το wdiget Card
        color: Colors.white,
        elevation: 10.0, //η σκια που θελουμε να φαινεται
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ), //στρογγυλοποιηση γωνιών της κάρτας
        child: Container(
          width: 165,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Center(
                  child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    titleer, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 65),
                  Center(
                    child: Text(
                      titlee, //δυναμικο κειμενο εικονας
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
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
                    color: Colors.black,
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

Widget customcardwithimage(
    String titleer, String titlee, String nums, String desc, String link) {
  return Padding(
    padding: EdgeInsets.all(2.0),
    child: InkWell(
      onTap: () {
        // Navigator.of(context).pushNamed(route);
        //Navigator.pushName(context,route); διαφορετικη συνταξη για το πανω
        // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>CardPage()));  διαφορετικη συνταξη για το απο πανω χωρις pageRoute

        //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(context)=>CardPage())); οταν καλειται ετσι σβηνει την Homepage απο στο stack και οταν πατησουμε επιστροφη παει στην προηγουμενη σελιδα απο το homepage δλδ στο SplashScreen
        //  Navigator.of(context).pushReplacementNamed(routePage); //το ιδιο με το απο πανω σε διαφορετικη συνταξη και με namedRoutes

        print('card tapped'); //τυπωνεται οταν πατιεται η καρτα λογω του InkWell
      },
      child: Card(
        //το wdiget Card
        color: Colors.white,
        elevation: 10.0, //η σκια που θελουμε να φαινεται
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ), //στρογγυλοποιηση γωνιών της κάρτας
        child: Container(
          width: 165,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
              Center(
                  child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Text(
                    titleer, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 65),
                  Center(
                    child: Text(
                      titlee, //δυναμικο κειμενο εικονας
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )),
              Image.network(
                link,
                width: 100,
              ),
              Container(
                padding: EdgeInsets.all(3.0),
                child: Text(
                  desc,
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

class CardPageHeartbeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 221, 221),
      appBar: AppBar(
        title: Text('Heartbeat'),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: [
          Row(
            children: [
              customcard('Rest', "4h 45m", "76", "bpm"),
              customcard('Active', "30m", "82", "bpm"),
            ],
          ),
          Row(
            children: [
              customcardwithimage('Fitness Level', "", "66", "Fit",
                  'https://www.iconpacks.net/icons/2/free-heart-beat-icon-2938-thumb.png'),
              customcardwithimage('Endurance', "", "66", "Ok",
                  'https://cdn-icons-png.flaticon.com/512/4305/4305607.png'),
            ],
          )
        ],
      ),
    );
  }
}

class CardPageBlood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 221, 221),
      appBar: AppBar(
        title: Text('Blood pressure'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        children: [
          Row(children: [
            customcard('Rest', "4h 45m", "76", "bpm"),
            customcard('Active', "30m", "82", "bpm"),
          ]),
          Row(
            children: [
              customcardwithimage('Fitness Level', "", "66", "Fit",
                  'https://www.iconpacks.net/icons/2/free-heart-beat-icon-2938-thumb.png'),
              customcardwithimage('Endurance', "", "66", "Ok",
                  'https://cdn-icons-png.flaticon.com/512/4305/4305607.png'),
            ],
          )
        ],
      ),
    );
  }
}

class CardPageActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 221, 221),
      appBar: AppBar(
        title: Text('Activity'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Row(
            children: [
              customcard('Rest', "4h 45m", "76", "bpm"),
              customcard('Active', "30m", "82", "bpm"),
            ],
          ),
          Row(
            children: [
              customcardwithimage('Fitness Level', "", "66", "Fit",
                  'https://www.iconpacks.net/icons/2/free-heart-beat-icon-2938-thumb.png'),
              customcardwithimage('Endurance', "", "66", "Ok",
                  'https://cdn-icons-png.flaticon.com/512/4305/4305607.png'),
            ],
          )
        ],
      ),
    );
  }
}
