import 'package:flutter/material.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'usersinfo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(199, 241, 111, 231),
                    ),
                    child: Text(
                      'Menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: ClipOval(
                            child: Image(
                              image: AssetImage("assets/image/man.png"),
                            ),
                          ),
                        ),
                        const Text('  Demographics'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const userInfo()));
                    },
                  )
                ],
              ),
            ),
            appBar: AppBar(
              title: Text(
                "SQFlite app",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Color.fromARGB(199, 241, 111, 231),
            )));
  }
}
