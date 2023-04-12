import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/models/question.dart';

import '../models/question_model.dart';

class FourATestPage extends StatefulWidget {
  const FourATestPage({super.key});

  @override
  State<FourATestPage> createState() => _FourATestPageState();
}

class _FourATestPageState extends State<FourATestPage> {
  late Box<QuestionModel> _questionBox;
  late Future<void> _boxInitialization;

  @override
  void initState() {
    super.initState();
    _boxInitialization = _initBox();
  }

  Future<void> _initBox() async {
    _questionBox = await Hive.openBox<QuestionModel>('fourAQuestionBox');
  }

  @override
  void dispose() async {
    _questionBox.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder<void>(
        future: _boxInitialization,
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<QuestionModel> questions = _questionBox.values.toList();
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
              },
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
    ));
  }
}
