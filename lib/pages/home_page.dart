import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/pages/question_settings_page.dart';
import 'package:quiz_app/pages/settings_page.dart';
import 'test_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Power\nEngineer',
                        style: TextStyle(
                            fontSize: 52,
                            fontFamily: 'neue-machina',
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        'Exam repo',
                        style:
                            TextStyle(fontSize: 48, fontFamily: 'neue-machina'),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsPage()));
                    },
                    borderRadius: BorderRadius.circular(5),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.settings,
                        size: 32,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionSettingsPage(
                                  databaseName: '4A')));
                    },
                    title: const Text(
                      '4A exam preperation',
                      style: TextStyle(fontFamily: 'neue-machina'),
                    ),
                    subtitle: const Text(
                      '2000 questions',
                    ),
                    leading: const SizedBox(
                      height: 50,
                      width: 75,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '4A',
                              style: TextStyle(
                                  fontFamily: 'maison-neue-mono',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionSettingsPage(
                                  databaseName: '4B')));
                    },
                    title: const Text('4B exam questions',
                        style: TextStyle(fontFamily: 'neue-machina')),
                    subtitle: const Text('2000 questions'),
                    leading: const SizedBox(
                      height: 50,
                      width: 75,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '4B',
                              style: TextStyle(
                                  fontFamily: 'maison-neue-mono',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionSettingsPage(
                                  databaseName: '3A1')));
                    },
                    title: const Text('3A1 exam questions',
                        style: TextStyle(fontFamily: 'neue-machina')),
                    subtitle: const Text('2000 questions'),
                    leading: const SizedBox(
                      height: 50,
                      width: 75,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '3A1',
                              style: TextStyle(
                                  fontFamily: 'maison-neue-mono',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionSettingsPage(
                                  databaseName: '3A2')));
                    },
                    title: const Text('3A2 exam questions',
                        style: TextStyle(fontFamily: 'neue-machina')),
                    subtitle: const Text('2000 questions'),
                    leading: const SizedBox(
                      height: 50,
                      width: 75,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '3A2',
                              style: TextStyle(
                                  fontFamily: 'maison-neue-mono',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionSettingsPage(
                                  databaseName: '3B1')));
                    },
                    title: const Text('3B1 exam questions',
                        style: TextStyle(fontFamily: 'neue-machina')),
                    subtitle: const Text('2000 questions'),
                    leading: const SizedBox(
                      height: 50,
                      width: 75,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '3B1',
                              style: TextStyle(
                                  fontFamily: 'maison-neue-mono',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuestionSettingsPage(
                                  databaseName: '3B2')));
                    },
                    title: const Text('3B2 exam questions',
                        style: TextStyle(fontFamily: 'neue-machina')),
                    subtitle: const Text('2000 questions'),
                    leading: const SizedBox(
                      height: 50,
                      width: 75,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '3B2',
                              style: TextStyle(
                                  fontFamily: 'maison-neue-mono',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey)),
                      onPressed: () {},
                      child: const Text(
                        'Book an exam online',
                        style: TextStyle(
                            fontFamily: 'neue-machina',
                            fontWeight: FontWeight.w900,
                            color: Colors.black),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('View previous exam results',
                          style: TextStyle(
                              fontFamily: 'neue-machina',
                              fontWeight: FontWeight.w900,
                              color: Colors.black))),
                )
              ],
            )
          ])),
    );
  }
}

Future<Map<String, CategoryInfo>> generateQuestionSettings(
    String boxName) async {
  Map<String, CategoryInfo> questionCategories = {};
  Box<QuestionModel> box = await Hive.openBox(boxName);

  List<QuestionModel> allQuestions = [];
  for (QuestionModel value in box.values) {
    allQuestions.add(value);
  }

  return questionCategories;
}

class CategoryInfo {
  CategoryInfo({this.count = 1, this.isChecked = true});

  int count;
  bool isChecked;
}
