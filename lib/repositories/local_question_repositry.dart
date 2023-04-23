import 'package:hive/hive.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repositories/question_repository.dart';

import '../models/question_model.dart';

class LocalQuestionRepository implements QuestionRepository {
  @override
  Future<List<Question>> getQuestions(String databaseName) async {
    await Hive.openBox<QuestionModel>(databaseName);
    List<Question> questions = [];
    Box<QuestionModel> box = Hive.box(databaseName);
    for (QuestionModel questionModel in box.values) {
      questions.add(Question(
          question: questionModel.question,
          answers: questionModel.answers,
          correctAnswerIndex: questionModel.correctAnswerIndex,
          category: questionModel.category));
    }
    box.close();
    return questions;
  }
}
