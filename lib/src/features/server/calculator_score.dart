class CalculatorScore {
  static int reOrderParagraphScore(
      {required List<String> userChoice, required List<String> answers}) {
    final List<int> orderAnswers = List.generate(userChoice.length,
        (index) => answers.indexOf(userChoice.elementAt(index)));

    final maxReOrderParagraphScore = answers.length;
    var lengthMaxContinue = 0;
    for (int index = 0; index < orderAnswers.length - 1; index++) {
      var maxSubItem = orderAnswers[index];
      var lengthMaxSub = 1;
      for (int jindex = index + 1;
          jindex < orderAnswers.length && orderAnswers[jindex] > maxSubItem;
          jindex++) {
        {
          lengthMaxSub++;
          maxSubItem = orderAnswers[jindex];
        }
      }
      if (lengthMaxSub > lengthMaxContinue) lengthMaxContinue = lengthMaxSub;
    }
    final score = lengthMaxContinue > 1 ? lengthMaxContinue : 0;

    return score.clamp(0, maxReOrderParagraphScore);
  }

  static int multipleAnswerScore({
    required List<String> userChoice,
    required List<String> answers,
  }) {
    var score = 0;
    final maxMultipleAnswerScore = answers.length;

    for (var item in answers) {
      if (userChoice.contains(item)) {
        score++;
      }
    }

    final numberFalseChoice = userChoice.length - score;
    score = score - numberFalseChoice;

    return score.clamp(0, maxMultipleAnswerScore);
  }

  static int singleAnswerScore({
    required String userChoice,
    required String answers,
  }) {
    var score = 0;
    const maxSingleAnswerScore = 1;
    if (answers == userChoice) {
      score = maxSingleAnswerScore;
    }

    return score.clamp(0, maxSingleAnswerScore);
  }
}
