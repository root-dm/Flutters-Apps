import 'dart:convert';

import 'package:database/helpers/db_helpers.dart';
import 'package:flutter/material.dart';
import './register.dart';
import './homescreen.dart';

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
  testLogin(String username, String password) async {
    final user = await DBHelper.testLogin('users', username, password);
    print(user);
    if (!user.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(user)),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //bazw singlechildscroll giati alliws otan anoigei to keyboard kanei overflow
        child: Center(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(80)),
              Container(
                  width: 300,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text("Username"),
                        Padding(padding: EdgeInsets.all(5)),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your name',
                          ),
                          controller: usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Padding(padding: EdgeInsets.all(5)),
                        Text("Password"),
                        Padding(padding: EdgeInsets.all(5)),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter your name',
                          ),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 117, 150, 187)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                testLogin(usernameController.text,
                                    passwordController.text);
                              }
                            },
                            child: Center(child: const Text('Sign in')),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                },
                                child: Center(
                                  child: const Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ])
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
