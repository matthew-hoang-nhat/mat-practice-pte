import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/raw_lesson_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';

import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

import 'server.dart';

class FServerImpl extends FServer {
  RawLessonCollectionReference lessonRef(String idCategory) =>
      RawLessonCollectionReference(idCategory);

  final fWidgets = GlobalVariables.getIt<FApp>();
  @override
  Future<FResult<Map<String, int>>> doScore(DoScore doScore) async {
    try {
      if (doScore.idCategory == null) return FResult.error('Empty id Category');

      final typeLesson =
          GlobalVariables.nameRouteLessonType[doScore.idCategory];

      final lessonSnapshot = await lessonRef(doScore.idCategory!)
          .ref
          .where('id', isEqualTo: doScore.idLesson)
          .get();
      final lesson = lessonSnapshot.docs.first.data();

      switch (typeLesson) {
        case AppPaths.singleChoiceAnswerScreen:
          final userChoice = doScore.answers.first;
          final answer = lesson.questionGroup.questions.first.answer.first;

          const maxScore = 1;
          var score =
              getScoreSingleAnswer(userChoice: userChoice, answer: answer);

          return FResult.success({'myScore': score, 'totalScore': maxScore});

        case AppPaths.mutipleChoiceAnswerScreen:
          final answers = lesson.questionGroup.questions.first.answer;

          final maxScore = answers.length;
          final score = getScoreMultipleAnswer(
              userChoice: doScore.answers, answers: answers);

          return FResult.success({'myScore': score, 'totalScore': maxScore});
        default:
          return FResult.error('Not found category to do score');
      }
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  int getScoreMultipleAnswer({
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

  int getScoreSingleAnswer({
    required String userChoice,
    required String answer,
  }) {
    var score = 0;

    if (answer == userChoice) {
      score = 1;
    }

    return score >= 0 ? score : 0;
  }

  @override
  Future<FResult<String>> uploadNewResultDoScoreUser() {
    throw UnimplementedError();
  }
}
