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

    print(stringIndex);
    //print('button pressed');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
          backgroundColor: Colors.blueGrey,
        ),
        body: Center(
          child: Column(
            children: [
              Text(dynamicStrings[stringIndex]),
              ElevatedButton(
                onPressed: pressedButton,
                child: Text("Press me"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
