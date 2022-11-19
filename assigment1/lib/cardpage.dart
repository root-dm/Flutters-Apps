import 'package:flutter/material.dart';

class CardPageHeartbeat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text('Heartbeat'),
          backgroundColor: Colors.blueAccent,
        ),
        body: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Rest',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '4h 45m',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Center(
                    child: Text(
                      '76',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'avg bpm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '30m',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Center(
                    child: Text(
                      '82',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'avg bpm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Fitness Level',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Image(
                        width: 60, //να γεμιζει η εικονα τον χωρο
                        image: AssetImage(
                            'assets/images/heartbeatr.png'), //δυναμικο path εικονας
                      ),
                      Text(
                        'Fit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Endurance',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Image(
                        width: 70, //να γεμιζει η εικονα τον χωρο
                        image: AssetImage(
                            'assets/images/battery.png'), //δυναμικο path εικονας
                      ),
                      Text(
                        'Ok',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class CardPageBlood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          title: Text('Blood Pressure'),
          backgroundColor: Colors.amberAccent,
        ),
        body: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Rest',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '4h 45m',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Center(
                    child: Text(
                      '76',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'avg bpm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '30m',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Center(
                    child: Text(
                      '82',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'avg bpm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Fitness Level',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Image(
                        width: 60, //να γεμιζει η εικονα τον χωρο
                        image: AssetImage(
                            'assets/images/heartbeatr.png'), //δυναμικο path εικονας
                      ),
                      Text(
                        'Fit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Endurance',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Image(
                        width: 70, //να γεμιζει η εικονα τον χωρο
                        image: AssetImage(
                            'assets/images/battery.png'), //δυναμικο path εικονας
                      ),
                      Text(
                        'Ok',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class CardPageActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[800],
        appBar: AppBar(
          title: Text('Activity'),
          backgroundColor: Colors.pink,
        ),
        body: GridView.count(
          padding: EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Rest',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '4h 45m',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Center(
                    child: Text(
                      '76',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'avg bpm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Active',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '30m',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Center(
                    child: Text(
                      '82',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'avg bpm',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Fitness Level',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Image(
                        width: 60, //να γεμιζει η εικονα τον χωρο
                        image: AssetImage(
                            'assets/images/heartbeatr.png'), //δυναμικο path εικονας
                      ),
                      Text(
                        'Fit',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Endurance',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(top: 5.0)),
                  Row(
                    children: [
                      Padding(padding: EdgeInsets.only(left: 25.0)),
                      Image(
                        width: 70, //να γεμιζει η εικονα τον χωρο
                        image: AssetImage(
                            'assets/images/battery.png'), //δυναμικο path εικονας
                      ),
                      Text(
                        'Ok',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
