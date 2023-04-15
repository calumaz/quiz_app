import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/pages/test_page.dart';
import 'package:quiz_app/widgets/category_select_view.dart';
import 'package:quiz_app/widgets/question_count_select_view.dart';
import 'package:riverpod/riverpod.dart';
import '../models/question_model.dart';
import '../riverpod/question_settings_notifier.dart';

class QuestionSettingsPage extends StatefulWidget {
  const QuestionSettingsPage({super.key, required this.boxName});
  final String boxName;

  @override
  State<QuestionSettingsPage> createState() => _QuestionSettingsPageState();
}

class _QuestionSettingsPageState extends State<QuestionSettingsPage> {
  late double _sliderValue;
  late Box<QuestionModel> _questionBox;
  late Future<void> _boxInitialization;
  late Map<String, int> _categoryCount = {};
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;

  @override
  void initState() {
    Future<void> initBox() async {
      _questionBox = await Hive.openBox<QuestionModel>(widget.boxName);
      for (QuestionModel question in _questionBox.values) {
        if (question.category == null) {
          _categoryCount.update(
            'Uncategorized',
            (value) => value + 1,
            ifAbsent: () {
              return 1;
            },
          );
        } else {
          _categoryCount.update((question.category!), (value) => value + 1,
              ifAbsent: () {
            return 1;
          });
        }
      }
      _sliderValue = ((_questionBox.length.toDouble()) / 2).roundToDouble();
    }

    super.initState();
    _boxInitialization = initBox();
  }

  @override
  Widget build(BuildContext context) {
    final questionSettingsProvider =
        StateNotifierProvider((ref) => QuestionSettingsNotifier());
    final settings = useProvider(questionSettingsProvider);

// Update the selected categories
    settings.updateSelectedCategories(selectedCategories);

// Update the question count
    settings.updateQuestionCount(questionCount);

    return Scaffold(
        body: SafeArea(
      child: Center(
        child: FutureBuilder(
          future: _boxInitialization,
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int newIndex) {
                        setState(() {
                          _currentPageIndex = newIndex;
                        });
                      },
                      children: [
                        CategorySelectView(categoryCount: _categoryCount),
                        QuestionCountSelectView(categoryCount: _categoryCount)
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text('Previous')),
                      ElevatedButton(onPressed: () {}, child: Text('Next'))
                    ],
                  ),
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

class QuestionSettings {
  List<String> selectedCategories;
  int questionCount;

  QuestionSettings(
      {required this.selectedCategories, required this.questionCount});

  QuestionSettings copyWith(
      {List<String>? selectedCategories, int? questionCount}) {
    return QuestionSettings(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      questionCount: questionCount ?? this.questionCount,
    );
  }
}
