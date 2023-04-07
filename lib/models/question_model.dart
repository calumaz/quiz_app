import 'package:hive/hive.dart';

part 'question_model.g.dart';

@HiveType(typeId: 0)
class QuestionModel {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final String correctAnswer;

  @HiveField(2)
  final List<String> incorrectAnswers;

  QuestionModel(
      {required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers});
}
