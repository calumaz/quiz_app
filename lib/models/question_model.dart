import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 0)
class QuestionModel {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final List<String> answers;

  @HiveField(2)
  final int correctAnswerIndex;

  QuestionModel(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex});

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
        question: json['question'] as String,
        answers: (json['answers'] as List)
            .map((answer) => answer as String)
            .toList(),
        correctAnswerIndex: json['correctAnswerIndex'] as int);
  }
}
