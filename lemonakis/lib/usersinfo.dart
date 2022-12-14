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
  final userinformation = DBHelper.test("users");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          //   body: Text(userinformation),
          ),
    );
  }
}
