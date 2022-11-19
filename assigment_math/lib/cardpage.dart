import 'package:flutter/material.dart';

class CardPagePython extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Python')),
      body: Text("Python page"),
    );
  }
}

class CardPageJava extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Java')),
      body: Text("Java page"),
    );
  }
}

class CardPageJavascript extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Javascript')),
      body: Text("Javascript page"),
    );
  }
}

class CardPageCpp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('C++')),
      body: Text("C++ page"),
    );
  }
}
