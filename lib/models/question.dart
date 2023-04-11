import 'package:flutter/rendering.dart';

class Question {
  String question;
  List<String> answers;
  int correctAnswerIndex;

  Question(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});
}
