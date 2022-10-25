import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var dynamicStrings = ['flutter', 'is', 'easy', 'and', 'awesome'];
  var stringIndex = 0;

  pressedButton() {
    setState(() {
      stringIndex = stringIndex + 1;
      if (stringIndex > 4) {
        stringIndex = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Test app'),
          backgroundColor: Colors.purple,
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpg'), fit: BoxFit.cover),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  dynamicStrings[stringIndex],
                  style: TextStyle(fontSize: 25),
                ),
                ElevatedButton(
                  onPressed: pressedButton,
                  child: Text("Press me"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.pink,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
