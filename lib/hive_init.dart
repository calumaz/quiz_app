import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:quiz_app/models/question_model.dart';

class HiveInit {
  static Future<void> init() async {
    final appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);

    Hive.registerAdapter(QuestionModelAdapter());
  }
}
