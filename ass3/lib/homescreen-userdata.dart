// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:database/login-register.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final List loggeddata;
  // ignore: use_key_in_widget_constructors
  const HomeScreen(this.loggeddata);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(
          "SQFlite app",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Color.fromARGB(255, 160, 37, 231),
      ),
      body: Center(
          child: Text("Database Functions",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold))),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 160, 37, 231),
              ),
              child: Center(
                child: Text(
                  'Menu',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
                ),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    height: 20,
                    width: 20,
                    child: Image.asset('assets/images/user.png'),
                  ),
                  Padding(padding: EdgeInsets.only(left: 15, top: 50)),
                  const Text('Demographics'),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserData(widget.loggeddata)));
              },
            )
          ],
        ),
      ),
    ));
  }
}

List<String> dropdownvalues = ['Male', 'Female', 'Do not want to declare'];

class UserData extends StatefulWidget {
  final List loggeddata;
  const UserData(this.loggeddata);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final _fKey = GlobalKey<FormState>();

  TextEditingController nController = TextEditingController();
  TextEditingController sController = TextEditingController();
  TextEditingController bController = TextEditingController();
  String gController = dropdownvalues.first;
  TextEditingController wController = TextEditingController();
  TextEditingController uController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController eController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
          backgroundColor: Color.fromARGB(255, 160, 37, 231),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Change any data you want",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: Form(
                  key: _fKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['name'],
                          border: OutlineInputBorder(),
                        ),
                        controller: nController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Surname",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['surname'],
                          border: OutlineInputBorder(),
                        ),
                        controller: sController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Birthdate",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextField(
                        controller: bController,
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['birthdate'],
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101));

                          if (pickedDate != null) {
                            String formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);
                            setState(() {
                              bController.text = formattedDate;
                            });
                          }
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Gender",
                        style: TextStyle(fontSize: 15),
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: gController,
                        onChanged: (String? newValue) {
                          setState(() {
                            gController = newValue!;
                          });
                        },
                        items: dropdownvalues
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Weight",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['weight'].toString(),
                          border: OutlineInputBorder(),
                        ),
                        controller: wController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              num.tryParse(value) == null) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Username",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['username'],
                          border: OutlineInputBorder(),
                        ),
                        controller: uController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Password",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "********",
                          border: OutlineInputBorder(),
                        ),
                        controller: pController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Enter a valid password';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Email",
                        style: TextStyle(fontSize: 15),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.loggeddata[0]['email'],
                          border: OutlineInputBorder(),
                        ),
                        controller: eController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('.') ||
                              !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 160, 37, 231)),
                            ),
                            onPressed: () {
                              if (_fKey.currentState!.validate()) {
                                DBHelper.updater('demographics', {
                                  'id': int.parse(
                                      widget.loggeddata[0]['id'].toString()),
                                  'name': nController.text,
                                  'surname': sController.text,
                                  'birthdate': bController.text,
                                  'gender': gController,
                                  'weight': wController.text.toString(),
                                  'username': uController.text,
                                  'password': pController.text,
                                  'email': eController.text
                                });
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              }
                            },
                            child: Center(child: const Text('Update data')),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
