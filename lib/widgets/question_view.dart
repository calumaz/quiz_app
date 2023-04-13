import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key, required this.question});
  final QuestionModel question;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.question.question),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.question.answers.length,
            itemBuilder: (context, index) {
              return Text(widget.question.answers[index]);
            }),
        Text(widget.question.correctAnswerIndex.toString())
      ],
    );
  }
}
