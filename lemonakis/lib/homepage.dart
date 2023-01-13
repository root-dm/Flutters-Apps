import 'package:flutter/material.dart';
import 'usersinfo.dart';

class HomePage extends StatefulWidget {
  final List user;
  const HomePage(this.user);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(child: Text("Database Functions")),
            drawer: Drawer(
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(198, 87, 77, 231),
                    ),
                    child: Text(
                      'Menu',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  ListTile(
                    title: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                        const Text('Demographics'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserInfo(widget.user)));
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
              backgroundColor: Color.fromARGB(198, 87, 77, 231),
            )));
  }
}
