import 'package:database/helpers/db_helpers.dart';
import 'package:flutter/material.dart';

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
  Future<void> fetchAndSetData() async {
    final datalist = await DBHelper.getData("demographics");
    print(datalist);
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController(text: "Name");
  TextEditingController surnameController =
      TextEditingController(text: "Surname");
  TextEditingController ageController = TextEditingController(text: "Age");

  databaseInsert(String name, String surname, String age) {
    print(name + " " + surname + " " + age);
    DBHelper.insert(
        'demographics', {'name': name, 'surname': surname, 'age': age});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            // ElevatedButton(
            //   onPressed: databaseInsert,
            //   child: Text("Insert"),
            // ),
            ElevatedButton(
              onPressed: fetchAndSetData,
              child: Text("Print data"),
            ),
            Container(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller:
                            nameController, //χρησιμοποιουμε τον controller ωστε να μπορουμε να παρουμε την τιμη του καθε πεδιου οταν γινεται submit η φορμα
                        //initialValue: "Some text", το initial value δεν μπορει να χρησιμοποιηθει μαζι με την επιλογη controller
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller:
                            surnameController, //χρησιμοποιουμε τον controller ωστε να μπορουμε να παρουμε την τιμη του καθε πεδιου οταν γινεται submit η φορμα
                        //initialValue: "Some text", το initial value δεν μπορει να χρησιμοποιηθει μαζι με την επιλογη controller
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller:
                            ageController, //χρησιμοποιουμε τον controller ωστε να μπορουμε να παρουμε την τιμη του καθε πεδιου οταν γινεται submit η φορμα
                        //initialValue: "Some text", το initial value δεν μπορει να χρησιμοποιηθει μαζι με την επιλογη controller
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Validate returns true if the form is valid, or false otherwise.
                            if (_formKey.currentState!.validate()) {
                              databaseInsert(nameController.text,
                                  surnameController.text, ageController.text);
                              // Αν η φορμα ειναι valid τυπωσε ενα snackbar (στο κατω μερος της εφαρμογης εμφανιζεται μια μαυρη μπαρα με το κειμενο)
                              // συνηθως εδω σε πραγματικες εφαρμογες σωνονται οι πληροφοριες στην βαση
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
