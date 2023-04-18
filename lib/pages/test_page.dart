import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/pages/question_settings_page.dart';
import 'package:quiz_app/widgets/question_view.dart';
import '../models/question_model.dart';

class TestPage extends StatefulWidget {
  final String boxName;
  final QuestionSettings? questionSettings;

  const TestPage({super.key, required this.boxName, this.questionSettings});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Box<QuestionModel> _questionBox;
  late Future<void> _boxInitialization;
  late List<QuestionModel> _questions;

  @override
  void initState() {
    Future<void> initBox() async {
      _questionBox = await Hive.openBox<QuestionModel>(widget.boxName);
      if (widget.questionSettings == null) {
        _questions = _questionBox.values.toList();
      } else {
        _questions = _questionBox.values
            .take(widget.questionSettings!.questionCount)
            .toList();
      }
    }

    super.initState();
    _boxInitialization = initBox();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<void>(
            future: _boxInitialization,
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) { 
                return PageView.builder(
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      return QuestionView(question: _questions[index]);
                    });
              } else {
                return const Center(child: Text('Failed to load PageViews.'));
              }
            })),
      ),
    );
  }
}
