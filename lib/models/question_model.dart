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
}
