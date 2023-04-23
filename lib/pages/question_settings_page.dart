import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/repositories/local_question_repositry.dart';
import 'package:quiz_app/repositories/question_repository.dart';
import 'package:quiz_app/usecases/get_questions.dart';
import '../models/question.dart';
import '../models/question_model.dart';

final sliderValueProvider = StateProvider<double>((ref) => 30.0);

class QuestionSettingsPage extends StatelessWidget {
  QuestionSettingsPage(
      {super.key, required this.pageTitle, required this.databaseName});
  final String pageTitle;
  final String databaseName;
  final QuestionRepository repository = LocalQuestionRepository();
  late GetQuestions usecase = GetQuestions(repository: repository);

  @override
  Widget build(BuildContext context) {
    final questionListFutureProvider =
        FutureProvider<List<Question>>((ref) async {
      return usecase(databaseName);
    });

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  pageTitle,
                  style: const TextStyle(
                      fontFamily: 'neue-machina',
                      fontSize: 84,
                      fontWeight: FontWeight.w900),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(' Question',
                        style: TextStyle(
                            fontFamily: 'neue-machina', fontSize: 32)),
                    Text(' select',
                        style:
                            TextStyle(fontFamily: 'neue-machina', fontSize: 32))
                  ],
                )
              ],
            ),
            const SizedBox(height: 16),
            Container(
              color: const Color.fromARGB(255, 81, 81, 81),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select\ncategories',
                        style: TextStyle(
                            fontFamily: 'maison-neue-mono', fontSize: 32)),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 6,
                              child: ElevatedButton(
                                  child: const Text('Select a category',
                                      style: TextStyle(
                                          fontFamily: 'maison-neue-mono',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black)),
                                  onPressed: () {})),
                          const SizedBox(width: 16),
                          Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                  child: const Text('All',
                                      style: TextStyle(
                                          fontFamily: 'maison-neue-mono',
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black)),
                                  onPressed: () {}))
                        ]),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: const [
                        Text('Selected Category: ',
                            style: TextStyle(
                              fontFamily: 'maison-neue-mono',
                              fontWeight: FontWeight.w400,
                            )),
                        Text('[all]',
                            style: TextStyle(
                                fontFamily: 'maison-neue-mono',
                                fontWeight: FontWeight.w400,
                                color: Colors.limeAccent))
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: const Color.fromARGB(255, 81, 81, 81),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('Number of\nquestions',
                            style: TextStyle(
                                fontFamily: 'maison-neue-mono', fontSize: 32)),
                        Consumer(builder: (context, ref, child) {
                          final sliderValue = ref.watch(sliderValueProvider);
                          return Expanded(
                              child: Text(sliderValue.round().toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                      color: Colors.limeAccent,
                                      fontFamily: 'maison-neue-mono',
                                      fontSize: 32)));
                        })
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        final sliderValue = ref.watch(sliderValueProvider);
                        return Slider(
                          label: 'label',
                          divisions: 4,
                          min: 10.0,
                          max: 50.0,
                          value: sliderValue,
                          onChanged: (newValue) {
                            ref
                                .read(sliderValueProvider.notifier)
                                .update((state) => newValue);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return Expanded(
                  child: FutureBuilder(
                    future: ref.watch(questionListFutureProvider.future),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.connectionState ==
                              ConnectionState.done &&
                          snapshot.hasData) {
                        return const Placeholder();
                      } else {
                        return const Text('an error has occurred...');
                      }
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 81, 81, 81))),
                    child: const Icon(Icons.keyboard_double_arrow_left_sharp),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 4,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Start test',
                          style: TextStyle(
                              fontFamily: 'maison-neue-mono',
                              fontWeight: FontWeight.w900,
                              color: Colors.black))),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
