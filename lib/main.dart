import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quiz_app/hive_init.dart';
import 'package:riverpod/riverpod.dart';

import 'models/question.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          ElevatedButton(onPressed: () {}, child: Text('add thing'))
        ]),
      ),
    );
  }
}

void addQuestion(Question question) {}
