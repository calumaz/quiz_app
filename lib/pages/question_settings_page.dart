import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/pages/test_page.dart';

import '../models/question_model.dart';

class QuestionSettingsPage extends StatefulWidget {
  const QuestionSettingsPage({super.key, required this.boxName});
  final String boxName;

  @override
  State<QuestionSettingsPage> createState() => _QuestionSettingsPageState();
}

class _QuestionSettingsPageState extends State<QuestionSettingsPage> {
  double? _sliderValue;
  late Box<QuestionModel> _questionBox;
  late Future<void> _boxInitialization;
  late Map<String, int> _categoryCount = {};

  @override
  void initState() {
    Future<void> initBox() async {
      _questionBox = await Hive.openBox<QuestionModel>(widget.boxName);
      for (QuestionModel question in _questionBox.values) {
        if (question.category == null) {
          _categoryCount.update(
            'Uncategorized',
            (value) => value + 1,
            ifAbsent: () => 1,
          );
        } else {
          _categoryCount.update(
            (question.category!),
            (value) => value + 1,
            ifAbsent: () => 1,
          );
        }
      }
      _sliderValue = _questionBox.length.toDouble();
    }

    super.initState();
    _boxInitialization = initBox();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: FutureBuilder(
          future: _boxInitialization,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Text(_questionBox.length.toString()),
                  Text('Slider value $_sliderValue'),
                  Slider(
                      value: _sliderValue!,
                      min: 1,
                      max: _questionBox.values.length.toDouble(),
                      onChanged: (newValue) {
                        setState(() {
                          _sliderValue = newValue.round().toDouble();
                        });
                      }),
                  ListView.builder(
                      shrinkWrap: true,
                      itemCount: _categoryCount.length,
                      itemBuilder: (context, index) {
                        final item = _categoryCount.entries.elementAt(index);
                        return ListTile(
                            title: Text(item.key),
                            trailing: Text(item.value.toString()));
                      }),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    TestPage(boxName: widget.boxName)));
                      },
                      child: const Text('Go to test'))
                ],
              );
            } else {
              return const CircularProgressIndicator();
            }
          }),
        ),
      ),
    ));
  }
}
