import 'package:flutter/material.dart';
import 'helpers/db_helper.dart';

void main() {
  runApp(const MyApp());
}

final _formKey = GlobalKey<FormState>();
TextEditingController textController = TextEditingController(text: 'note');

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> fetchData() async {
    final datalist = await DBHelper.getData('notes');
    print(datalist);
  }

  databaseInsert() {
    DBHelper.insert('notes', {
      'title': 'my note',
      'text': 'this is my dummy text',
      'extra': 'extra details',
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Load SQL Lite',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Column(
          children: [
            ElevatedButton(
                onPressed: databaseInsert, child: Text('Insert Data')),
            ElevatedButton(onPressed: fetchData, child: Text('Fetch Data')),
          ],
        ));
  }
}
