class Question {
  String question;
  List<String> answers;
  int correctAnswerIndex;
  String? category;

  Question(
      {required this.question,
      required this.answers,
      required this.correctAnswerIndex,
      this.category});
}
