import 'package:flutter/material.dart';
import './userdata.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  final List user;
  const HomeScreen(this.user);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Center(child: Text("Database Functions")),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 117, 150, 187),
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
                              builder: (context) => UserData(widget.user)));
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
              backgroundColor: Color.fromARGB(255, 117, 150, 187),
            )));
  }
}
