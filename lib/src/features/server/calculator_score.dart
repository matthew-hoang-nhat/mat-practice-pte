class CalculatorScore {
  static int reOrderParagraphScore(
      {required List<String> userChoice, required List<String> answers}) {
    final List<int> orderAnswers = List.generate(userChoice.length,
        (index) => answers.indexOf(userChoice.elementAt(index)));

    var lengthMax = 0;
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
      if (lengthMaxSub > lengthMax) lengthMax = lengthMaxSub;
    }
    return lengthMax > 1 ? lengthMax : 0;
  }

  static int multipleAnswerScore({
    required List<String> userChoice,
    required List<String> answers,
  }) {
    var score = 0;

    for (var item in answers) {
      if (userChoice.contains(item)) {
        score++;
      }
    }

    final numberFalseChoice = userChoice.length - score;

    score = score - numberFalseChoice;
    return score >= 0 ? score : 0;
  }

  static int singleAnswerScore({
    required String userChoice,
    required String answers,
  }) {
    var score = 0;

    if (answers == userChoice) {
      score = 1;
    }

    return score >= 0 ? score : 0;
  }
}
