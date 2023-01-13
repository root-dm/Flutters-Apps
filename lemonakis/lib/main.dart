import 'package:database/helpers/db_helpers.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'homepage.dart';

void main() => runApp(MaterialApp(
      routes: {
        '/': (context) => MyApp(),
      },
    ));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Sign In",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
//
              const MyCustomForm(),
//
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Do you have an Account ? ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(199, 241, 111, 231),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupPage()));
                },
                child: const Text(
                  'SignUp',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() {
    return _MyCustomFormState();
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  // Δημιουργουμε ενα global key το οποιο χαρακτηριζει μονδαικα την φορμα (Form widget)
  // και επιτρεπει να κανουμε validate την φορμα (να ελεγχουμε αν εχουν περασει σωστα ολες οι τιμες)
  //

  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 250,
            child: TextFormField(
              controller: usernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ), //χρησιμοποιουμε τον controller ωστε να μπορουμε να παρουμε την τιμη του καθε πεδιου οταν γινεται submit η φορμα
              //initialValue: "Some text", το initial value δεν μπορει να χρησιμοποιηθει μαζι με την επιλογη controller
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid Username';
                }
                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                width: 250,
                child: TextFormField(
                  obscureText: true, // gia na min fainetai to password
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      //ελεγχουμε αν υπαρχει το @ ωστε να θεωρηθει οτι ειναι σωστο email
                      return 'Please enter a valid Password';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          //
          //
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(199, 241, 111, 231)),
              onPressed: () async {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  final user = await DBHelper.testLogin('users',
                      usernameController.text, passwordController.text);
                  print(user);
                  if (!user.isEmpty) {
                    print('Login successful');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage(user)),
                    );
                  } else {
                    print('Login failed');
                  }
                }
              },
              child: const Text(
                'Submit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
