import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class QuestionCountSelectView extends StatefulWidget {
  const QuestionCountSelectView({super.key, required this.categoryCount});
  final Map<String, int> categoryCount;

  @override
  State<QuestionCountSelectView> createState() =>
      _QuestionCountSelectViewState();
}

class _QuestionCountSelectViewState extends State<QuestionCountSelectView> {
  late double _sliderValue;

  @override
  void initState() {
    _sliderValue = .5;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: _sliderValue,
        min: 0,
        max: 1,
        thumbColor: Colors.lime,
        onChanged: (newValue) {
          setState(() {
            _sliderValue = newValue;
          });
        });
  }
}
