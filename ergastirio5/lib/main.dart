import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback handler;
  final String answerText;
  const Answer(this.handler, this.answerText);
}

void main() {
  List<int> numbers = [4, 59, 135, 7264];
  var powNumbers = numbers.map((num) => num * 2);
  print(powNumbers);
}
