import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questiontext;// εδω περναει το κειμενο
  Question(this.questiontext);//o constructor
   
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,// το χρησιμοποιουμε για να πουμε στον container να πιασει ολο το width που βρισκει
      margin: EdgeInsets.all(10),
      child: Text(questiontext,
                  textAlign: TextAlign.center,));
  }
}