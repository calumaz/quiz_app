import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/hive_init.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:riverpod/riverpod.dart';

import 'models/question.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();
  await Hive.openBox<QuestionModel>('questionBox');
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  final Box<QuestionModel> questionBox = Hive.box<QuestionModel>('questionBox');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
              child: FutureBuilder(
            future: getAllQuestions(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                List<QuestionModel> questions = snapshot.data!;
                return ListView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      QuestionModel question = questions[index];
                      return ListTile(
                        title: Text(question.question),
                        subtitle: Text(question.answers.join(', ')),
                        trailing: Text(
                            'Correct answer index: ${question.correctAnswerIndex}'),
                      );
                    });
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              } else {
                return const Center(child: Text('No data found'));
              }
            },
          )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await questionBox.add(QuestionModel(
              question: 'What is the capital of Italy?',
              answers: ['Rome', 'Milan', 'Naples', 'Turin'],
              correctAnswerIndex: 0,
            ));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<List<QuestionModel>> getAllQuestions() async {
    List<QuestionModel> questions = questionBox.values.toList();
    return questions;
  }
}
