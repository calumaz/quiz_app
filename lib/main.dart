import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:quiz_app/hive_init.dart';
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveInit.init();
  await Hive.openBox<QuestionModel>('fourAQuestionBox');
  await Hive.openBox<QuestionModel>('fourBQuestionBox');
  await Hive.openBox<String>('versionBox');
  final mainApp = MainApp();
  await mainApp.checkAndUpdateDatabase();
  runApp(mainApp);
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final Box<String> versionBox = Hive.box<String>('versionBox');

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }

  Future<void> checkAndUpdateDatabase() async {
    // get the version number from the db
    String? version;
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    final Box<QuestionModel> fourAQuestionBox =
        Hive.box<QuestionModel>('fourAQuestionBox');
    final Box<QuestionModel> fourBQuestionBox =
        Hive.box<QuestionModel>('fourBQuestionBox');

    String? hiveVersion = versionBox.get('version');

    Future<void> updateDataBase() async {
      await fourAQuestionBox.clear();
      await fourBQuestionBox.clear();

      //TODO: Refactor.

      var jsonString = await rootBundle.loadString('assets/test_banks/4A.json');
      List<dynamic> jsonData = jsonDecode(jsonString);

      jsonData.forEach((questionData) {
        fourAQuestionBox.add(QuestionModel.fromJson(questionData));
      });

      jsonString = await rootBundle.loadString('assets/test_banks/4B.json');
      jsonData = jsonDecode(jsonString);

      jsonData.forEach((questionData) {
        fourBQuestionBox.add(QuestionModel.fromJson(questionData));
      });

      await versionBox.put('version', version!);
    }

    if (hiveVersion == null || hiveVersion != version) {
      await updateDataBase();
    }

    fourAQuestionBox.close();
    fourBQuestionBox.close();
  }
}
