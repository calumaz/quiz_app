import 'package:flutter/rendering.dart';

class Question {
  String question;
  String correct_answer;
  List<String> incorrect_answers;

  Question(
      {required this.question,
      required this.correct_answer,
      required this.incorrect_answers});
}
