import 'package:flutter/material.dart';
import 'package:database/helpers/db_helpers.dart';
import 'package:sqflite/sqflite.dart' as sql;

class userInfo extends StatefulWidget {
  const userInfo({super.key});

  @override
  State<userInfo> createState() => _userInfoState();
}

class _userInfoState extends State<userInfo> {
  final datalist = DBHelper.getData("users");
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  databaseUpdate() {
    DBHelper.updateItem(
        1,
        nameController.text,
        surnameController.text,
        weightController.text,
        usernameController.text,
        passwordController.text,
        emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Text(
              datalist.toString(),
            ),
            ElevatedButton(
              onPressed: () {
                databaseUpdate();
              },
              child: Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}
