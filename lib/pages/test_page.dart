import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/models/question.dart';
import 'package:quiz_app/widgets/question_view.dart';
import '../models/question_model.dart';

class TestPage extends StatefulWidget {
  final String boxName;

  const TestPage({super.key, required this.boxName});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  late Box<QuestionModel> _questionBox;
  late Future<void> _boxInitialization;

  @override
  void initState() {
    Future<void> initBox() async {
      _questionBox = await Hive.openBox<QuestionModel>(widget.boxName);
    }

    super.initState();
    _boxInitialization = initBox();
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
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.connectionState == ConnectionState.done) {
                List<QuestionModel> questions = _questionBox.values.toList();
                return PageView.builder(
                    itemCount: questions.length,
                    itemBuilder: (context, index) {
                      return QuestionView(question: questions[index]);
                    });
              } else {
                return const Center(child: Text('Failed to load PageViews'));
              }
            })),
      ),
    );
  }
}




// child: FutureBuilder<void>(
//         future: _boxInitialization,
//         builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.connectionState == ConnectionState.done) {
//             List<QuestionModel> questions = _questionBox.values.toList();
//             return ListView.builder(
//               itemCount: questions.length,
//               itemBuilder: (context, index) {
//                 QuestionModel question = questions[index];
//                 return ListTile(
//                   title: Text(question.question),
//                   subtitle: Text(question.answers.join(', ')),
//                   trailing: Text(
//                       'Correct answer index: ${question.correctAnswerIndex}'),
//                   leading: Text(index.toString()),
//                 );
//               },
//             );
//           } else if (snapshot.hasError) {
//             return const Center(child: Text('Error loading data'));
//           } else {
//             return const Center(child: Text('No data found'));
//           }
//         }