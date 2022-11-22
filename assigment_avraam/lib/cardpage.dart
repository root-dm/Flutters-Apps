import 'package:flutter/material.dart';

Widget customcard(String titleer, String nums, String desc) {
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
                  Padding(padding: EdgeInsets.only(left: 15.0)),
                  Text(
                    titleer, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  nums,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  desc,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
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

Widget customcard2(String title, String description, String photo) {
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
        elevation: 15.0, //η σκια που θελουμε να φαινεται
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
                    title, //δυναμικο κειμενο εικονας
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              )),
              Padding(padding: EdgeInsets.only(top: 10.0)),
              Image(
                image: AssetImage(photo),
                width: 100,
                height: 100,
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
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

class Heartbeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        title: Text('Heartbeat'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(
            children: [
              customcard('Rest          4h 45m', "76", "bpm"),
              customcard('Active           30m', "82", "bpm"),
            ],
          ),
          Row(
            children: [
              customcard2('Fitness Level', "Fit", 'assets/images/heart.png'),
              customcard2('Endurance', "Ok", 'assets/images/battery.png'),
            ],
          )
        ],
      ),
    );
  }
}

class BloodPressure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        title: Text('Blood pressure'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Row(children: [
            customcard('Rest         4h 45m', "76", "bpm"),
            customcard('Active          30m', "82", "bpm"),
          ]),
          Row(
            children: [
              customcard2('Fitness Level', "Fit", 'assets/images/heart.png'),
              customcard2('Endurance', "Ok", 'assets/images/battery.png'),
            ],
          )
        ],
      ),
    );
  }
}

class Activity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[250],
      appBar: AppBar(
        title: Text('Activity'),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(
            children: [
              customcard('Rest        4h 45m', "76", "bpm"),
              customcard('Active          30m', "82", "bpm"),
            ],
          ),
          Row(
            children: [
              customcard2('Fitness Level', "Fit", 'assets/images/heart.png'),
              customcard2('Endurance', "Ok", 'assets/images/battery.png'),
            ],
          )
        ],
      ),
    );
  }
}
