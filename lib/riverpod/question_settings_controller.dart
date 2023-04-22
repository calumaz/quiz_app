import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionSettingsController extends StateNotifier<QuestionSettingsState> {
  QuestionSettingsController()
      : super(QuestionSettingsState(selectedCategories: [], questionCount: 0));

  void updateCategories(List<String> categories) {
    state = QuestionSettingsState(
        selectedCategories: categories, questionCount: state.questionCount);
  }

  void updateQuestionCount() {
    int newCount = state.questionCount + 1;
    state = QuestionSettingsState(
        selectedCategories: state.selectedCategories, questionCount: newCount);
  }
}

final questionSettingsProvider =
    StateNotifierProvider<QuestionSettingsController, QuestionSettingsState>(
        (ref) => QuestionSettingsController());

class QuestionSettingsState {
  final List<String> selectedCategories;
  final int questionCount;

  QuestionSettingsState(
      {required this.selectedCategories, required this.questionCount});
}
