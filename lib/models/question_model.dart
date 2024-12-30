class Question {
  String question;
  List<String> chooses;
  int correctAnswerIndex;
  int? userAnswwer;
  Question({
    required this.question,
    required this.chooses,
    required this.correctAnswerIndex,
  });
}
