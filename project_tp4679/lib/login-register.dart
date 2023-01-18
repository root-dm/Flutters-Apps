import 'package:database/helpers/db_helpers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'homescreen-userdata.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  login(String username, String password) async {
    final returned = await DBHelper.login(username, password);
    if (!returned.isEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen(returned)),
      );
    }
  }

  TextEditingController uController = TextEditingController();
  TextEditingController pController = TextEditingController();
  final _fKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                  width: 320,
                  child: Form(
                    key: _fKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Sign in",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
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
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(fontSize: 15),
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          controller: pController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Center(
                          child: Container(
                            width: 200,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Color.fromARGB(255, 231, 140, 37)),
                              ),
                              onPressed: () {
                                if (_fKey.currentState!.validate()) {
                                  login(uController.text, pController.text);
                                }
                              },
                              child: Center(child: Text('Sign in')),
                            ),
                          ),
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              ElevatedButton(
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.white),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                },
                                child: Center(
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                              )
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

List<String> dropdownvalues = ['Male', 'Female', 'Do not want to declare'];

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50),
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Create an account, it's free",
                ),
              ),
              SizedBox(height: 30),
              Container(width: 280, child: const FormSignup()),
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
  final _fKey = GlobalKey<FormState>();

  TextEditingController nController = TextEditingController();
  TextEditingController sController = TextEditingController();
  TextEditingController bController = TextEditingController();
  String gController = dropdownvalues.first;
  TextEditingController wController = TextEditingController();
  TextEditingController unController = TextEditingController();
  TextEditingController pController = TextEditingController();
  TextEditingController eController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
          SizedBox(
            height: 10,
          ),
          Text(
            "Surname",
            style: TextStyle(fontSize: 15),
          ),
          TextFormField(
            decoration: InputDecoration(
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
          SizedBox(
            height: 10,
          ),
          Text(
            "Birthdate",
            style: TextStyle(fontSize: 15),
          ),
          TextField(
            controller: bController,
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
                  bController.text = formattedDate;
                });
              }
            },
          ),
          SizedBox(
            height: 10,
          ),
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
            items: dropdownvalues.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Weight",
            style: TextStyle(fontSize: 15),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: wController,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  num.tryParse(value) == null) {
                return 'Enter integer value';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Username",
            style: TextStyle(fontSize: 15),
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: unController,
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
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: pController,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Enter a password more than 8 characters';
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
              border: OutlineInputBorder(),
            ),
            controller: eController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !value.contains('.') ||
                  !value.contains('@')) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 10),
          Center(
            child: Container(
              width: 250,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 231, 140, 37)),
                ),
                onPressed: () {
                  if (_fKey.currentState!.validate()) {
                    DBHelper.insert('demographics', {
                      'name': nController.text,
                      'surname': sController.text,
                      'birthdate': bController.text,
                      'gender': gController,
                      'weight': wController.text.toString(),
                      'username': unController.text,
                      'password': pController.text,
                      'email': eController.text
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );

                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  }
                },
                child: Center(child: const Text('Sign up')),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
