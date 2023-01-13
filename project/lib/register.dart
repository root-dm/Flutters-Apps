import 'package:database/helpers/db_helpers.dart';
import 'package:database/main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<String> list = [
  'Male',
  'Female',
  'Do not want to declare'
]; //edw einai ta dropdown values

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(30)),
              Center(
                child: Text(
                  "Sign up",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  "Create an account, it's free",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Container(width: 300, child: const RegisterForm()),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  String genderController = list.first;
  TextEditingController weightController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  registerInsert(String name, String surname, String birthdate, String gender,
      String weight, String username, String password, String email) {
    DBHelper.insert('users', {
      'name': name,
      'surname': surname,
      'birthdate': birthdate,
      'gender': gender,
      'weight': weight,
      'username': username,
      'password': password,
      'email': email
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Name"),
          Padding(padding: EdgeInsets.all(5)),
          TextFormField(
            decoration: InputDecoration(
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
          //epomeno field
          Text("Surname"),
          Padding(padding: EdgeInsets.all(5)),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: surnameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          Padding(padding: EdgeInsets.all(5)),
          //epomeno field
          Text("Birthdate"),
          Padding(padding: EdgeInsets.all(5)),
          TextField(
            controller: birthdateController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            //Kwdikas apo https://www.fluttercampus.com/guide/39/how-to-show-date-picker-on-textfield-tap-and-get-formatted-date/
            readOnly: true,
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2101));

              if (pickedDate != null) {
                String formattedDate =
                    DateFormat('yyyy-MM-dd').format(pickedDate);
                setState(() {
                  birthdateController.text = formattedDate;
                });
              } else {
                print("Date is not selected");
              }
            },
          ),
          Padding(padding: EdgeInsets.all(5)),
          //epomeno field
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
            items: list.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          Padding(padding: EdgeInsets.all(5)),
          //epomeno field
          Text("Weight"),
          Padding(padding: EdgeInsets.all(5)),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
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
          //epomeno field
          Text("Username"),
          Padding(padding: EdgeInsets.all(5)),
          TextFormField(
            decoration: InputDecoration(
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
          //epomeno field
          Text("Password"),
          Padding(padding: EdgeInsets.all(5)),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            controller: passwordController,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 8) {
                return 'Enter a valid password (at least 8 characters)';
              }
              return null;
            },
          ),
          Padding(padding: EdgeInsets.all(5)),
          //epomeno field
          Text("Email"),
          Padding(padding: EdgeInsets.all(5)),
          TextFormField(
            decoration: InputDecoration(
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
                  registerInsert(
                      nameController.text,
                      surnameController.text,
                      birthdateController.text,
                      genderController,
                      weightController.text.toString(),
                      usernameController.text,
                      passwordController.text,
                      emailController.text);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: Center(child: const Text('Sign up')),
            ),
          ),
        ],
      ),
    );
  }
}
