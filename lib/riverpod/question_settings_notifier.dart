import 'package:quiz_app/pages/question_settings_page.dart';
import 'package:riverpod/riverpod.dart';

class QuestionSettingsNotifier extends StateNotifier<QuestionSettings> {
  QuestionSettingsNotifier()
      : super(QuestionSettings(selectedCategories: [], questionCount: 0));

  void updateSelectedCategories(List<String> categories) {
    state = state.copyWith(selectedCategories: categories);
  }

  void updateQuestionCount(int count) {
    state = state.copyWith(questionCount: count);
  }
}
