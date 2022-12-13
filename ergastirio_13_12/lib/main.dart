import 'package:database/form_example.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  Future<void> fetchAndSetData() async {
    final datalist = await DBHelper.getData("notes");
    print(datalist);
  }

  databaseInsert() {
    DBHelper.insert('notes', {
      'title': 'my note',
      'text': 'this is dummy text',
      'extra': 'extra details'
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: databaseInsert,
              child: Text("Insert"),
            ),
            ElevatedButton(
              onPressed: fetchAndSetData,
              child: Text("Print data"),
            ),
            const MyCustomForm(),
          ],
        ),
      ),
    );
  }
}
