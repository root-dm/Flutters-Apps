import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback handler; //ειναι ο pointer στο function
  final String answerText; // εδω περναει το κειμενο καθε απαντησης
  const Answer(this.handler, this.answerText); //o constructor για το answer

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // το χρησιμοποιουμε για να πουμε στον container να πιασει ολο το width που βρισκει
      child: ElevatedButton(
        onPressed:
            handler, //ο Pointer της συναρτησης στην main που αυξανει το index
        child: Text(answerText),
        style: ElevatedButton.styleFrom(primary: Colors.blue),
      ),
    );
  }
}
