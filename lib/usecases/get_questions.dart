import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/repositories/question_repository.dart';

class GetQuestions {
  final QuestionRepository repository;

  GetQuestions({required this.repository});

  @override
  Future<List<Question>> call(String databaseName) async {
    return repository.getQuestions(databaseName);
  }
}
