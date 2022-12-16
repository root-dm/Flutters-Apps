import 'dart:ffi';

import 'package:database/main.dart';
import 'package:flutter/material.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:intl/intl.dart';

List<String> list = ['Male', 'Female', 'Do not want to declare'];

class UserData extends StatefulWidget {
  final List user;
  const UserData(this.user);

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  updater(String id, String name, String birthdate, String gender,
      String weight, String username, String password, String email) {
    print(name);
    DBHelper.updater('users', {
      'id': int.parse(id),
      'name': name,
      'birthdate': birthdate,
      'gender': gender,
      'weight': weight,
      'username': username,
      'password': password,
      'email': email
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  String genderController = list.first;
  TextEditingController weightController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(5)),
              Center(
                child: Text(
                  "UserData",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.all(5)),
              Container(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child:
                              Text("ID: " + widget.user[0]['id'].toString())),
                      Text("Name"),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.user[0]['name'],
                          border: OutlineInputBorder(),
                        ),
                        controller: nameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      //other fields
                      Text("Birthdate"),
                      Padding(padding: EdgeInsets.all(5)),
                      TextField(
                        controller: birthdateController,
                        decoration: InputDecoration(
                          hintText: widget.user[0]['birthdate'],
                          border: OutlineInputBorder(),
                        ),
                        //Kwdikas apo https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/
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
                              print("Formated Date : $formattedDate");
                              birthdateController.text = formattedDate;
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      //other fields
                      Text("Gender"),
                      Padding(padding: EdgeInsets.all(5)),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        value: genderController,
                        onChanged: (String? newValue) {
                          setState(() {
                            genderController = newValue!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      //other fields
                      Text("Weight"),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: widget.user[0]['weight'].toString(),
                          border: OutlineInputBorder(),
                        ),
                        controller: weightController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              num.tryParse(value) == null) {
                            return 'Please enter integer';
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      //other fields
                      Text("Username"),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.user[0]['username'],
                          border: OutlineInputBorder(),
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
                      //other fields
                      Text("Password"),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.user[0]['password'],
                          border: OutlineInputBorder(),
                        ),
                        controller: passwordController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return 'Enter a valid password (at least 8 characters)';
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      //other fields
                      Text("Email"),
                      Padding(padding: EdgeInsets.all(5)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: widget.user[0]['email'],
                          border: OutlineInputBorder(),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@') ||
                              !value.contains('.')) {
                            return 'Please enter a valid email';
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
                              updater(
                                  widget.user[0]['id'].toString(),
                                  nameController.text,
                                  birthdateController.text,
                                  genderController,
                                  weightController.text.toString(),
                                  usernameController.text,
                                  passwordController.text,
                                  emailController.text);

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: Center(child: const Text('Update')),
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
