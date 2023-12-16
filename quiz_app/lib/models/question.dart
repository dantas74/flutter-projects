class QuestionModel {
  final String text;
  final List<String> answers;

  const QuestionModel(this.text, this.answers);

  List<String> get shuffledAnswers {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
