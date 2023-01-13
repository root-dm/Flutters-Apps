// ignore_for_file: prefer_is_not_empty, use_build_context_synchronously, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:intl/intl.dart';
List<String> genders = ['male', 'female', 'do not want to declare'];

void main() {
  runApp(
    const MaterialApp(
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> {

  TextEditingController usernamehandler = TextEditingController();
  TextEditingController passwordhandler = TextEditingController();
  final globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                  width: 320,
                  child: Form(
                    key: globalkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Sign in",
                          ),
                        ),
                        Text(
                          "Sign in",
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: usernamehandler,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Text(
                          "Password",
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: passwordhandler,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        Center(
                          child: Container(
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 231, 37, 37)),
                              ),
                              onPressed: () async {
                                if (globalkey.currentState!.validate()) {
                                  final  returned = await DBHelper.loginfunc(usernamehandler.text, passwordhandler.text);
                                  if (!returned.isEmpty) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => HomeScreen(returned)),
                                    );
                                  }
                                }
                              },
                              child: Center(child: Text('Sign in')),
                            ),
                          ),
                        ),
                        Center(child: Text("Don't have an account? ")),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()),
                            );
                          },
                          child: Center(
                            child: Text(
                              "Sign up",
                              
                            ),
                          ),
                        )
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

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 25),
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Create an account, it's free",
                ),
              ),
              SizedBox(height: 30),
              FormSignup()
            ],
          ),
        ),
      ),
    );
  }
}

class FormSignup extends StatefulWidget {
  const FormSignup({Key? key}) : super(key: key);

  @override
  FormSignupState createState() {
    return FormSignupState();
  }
}

class FormSignupState extends State<FormSignup> {
  final globalkey = GlobalKey<FormState>();

  TextEditingController namehandler = TextEditingController();
  TextEditingController surnamehandler = TextEditingController();
  TextEditingController birthdatehandler = TextEditingController();
  String genderhandler = genders.first;
  TextEditingController weighthandler = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordhandler = TextEditingController();
  TextEditingController emailhandler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: globalkey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Name",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: namehandler,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Surname",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: surnamehandler,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Birthdate",
          ),
          TextField(
            controller: birthdatehandler,
            decoration: InputDecoration(
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
                  birthdatehandler.text = formattedDate;
                });
              }
            },
          ),
          Text(
            "Gender",
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: genderhandler,
            onChanged: (String? newValue) {
              setState(() {
                genderhandler = newValue!;
              });
            },
            items: genders.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Text(
            "Weight",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: weighthandler,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  num.tryParse(value) == null) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Username",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: usernamecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Password",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: passwordhandler,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Text(
            "Email",
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: emailhandler,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains('.') ||
                  !value.contains('@')) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Center(
            child: Container(
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 231, 37, 37)),
                ),
                onPressed: () {
                  if (globalkey.currentState!.validate()) {
                    DBHelper.insert('ask3db', {
                      'name': namehandler.text,
                      'surname': surnamehandler.text,
                      'birthdate': birthdatehandler.text,
                      'gender': genderhandler,
                      'weight': weighthandler.text.toString(),
                      'username': usernamecontroller.text,
                      'password': passwordhandler.text,
                      'email': emailhandler.text
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                  }
                },
                child: Center(child: const Text('Sign up')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  final List mydata;
  // ignore: use_key_in_widget_constructors
  const HomeScreen(this.mydata);

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
        backgroundColor: Color.fromARGB(255, 231, 37, 37),
      ),
      body: Center(
          child: Text("Database Functions")),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 231, 37, 37),
              ),
              child: Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
            ListTile(
              title: Row(
                children: [
                  Container(
                    height: 35,
                    width: 35,
                    child: Icon(Icons.home),
                  ),
                  const Text('Demographics'),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UserData(widget.mydata)));
              },
            )
          ],
        ),
      ),
    ));
  }
}

class UserData extends StatefulWidget {
  final List mydata;
  const UserData(this.mydata);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final globalkey = GlobalKey<FormState>();

  TextEditingController namehandler = TextEditingController();
  TextEditingController surnamehandler = TextEditingController();
  TextEditingController birthdatehandler = TextEditingController();
  String genderhandler = genders.first;
  TextEditingController weighthandler = TextEditingController();
  TextEditingController usernamehandler = TextEditingController();
  TextEditingController passwordhandler = TextEditingController();
  TextEditingController emailhandler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
          backgroundColor: Color.fromARGB(255, 231, 37, 37),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                width: 300,
                child: Form(
                  key: globalkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Name",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['name'],
                          border: OutlineInputBorder(),
                        ),
                        controller: namehandler,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Surname",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['surname'],
                          border: OutlineInputBorder(),
                        ),
                        controller: surnamehandler,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Birthdate",
                      ),
                      TextField(
                        controller: birthdatehandler,
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['birthdate'],
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
                              birthdatehandler.text = formattedDate;
                            });
                          }
                        },
                      ),
                      Text(
                        "Gender",
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: genderhandler,
                        onChanged: (String? newValue) {
                          setState(() {
                            genderhandler = newValue!;
                          });
                        },
                        items: genders
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Text(
                        "Weight",
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['weight'].toString(),
                          border: OutlineInputBorder(),
                        ),
                        controller: weighthandler,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              num.tryParse(value) == null) {
                            return 'Enter a valid number';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Username",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['username'],
                          border: OutlineInputBorder(),
                        ),
                        controller: usernamehandler,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Password",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        controller: passwordhandler,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Text(
                        "Email",
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.mydata[0]['email'],
                          border: OutlineInputBorder(),
                        ),
                        controller: emailhandler,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('.') ||
                              !value.contains('@')) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Center(
                        child: Container(
                          width: 250,
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 231, 37, 37)),
                            ),
                            onPressed: () {
                              if (globalkey.currentState!.validate()) {
                                DBHelper.updatefun('ask3db', {
                                  'id': int.parse(
                                      widget.mydata[0]['id'].toString()),
                                  'name': namehandler.text,
                                  'surname': surnamehandler.text,
                                  'birthdate': birthdatehandler.text,
                                  'gender': genderhandler,
                                  'weight': weighthandler.text.toString(),
                                  'username': usernamehandler.text,
                                  'password': passwordhandler.text,
                                  'email': emailhandler.text
                                });
                              }
                            },
                            child: Center(child: const Text('Update db')),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}