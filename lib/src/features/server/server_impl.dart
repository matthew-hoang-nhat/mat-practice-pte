import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/server/calculator_score.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/raw_lesson_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';

import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
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
        case AppPaths.highlightSummary:
          final userChoice = doScore.answers.first;
          final answer = lesson.questionGroup.questions.first.answer.first;

          const maxScore = 1;
          var score = CalculatorScore.singleAnswerScore(
              userChoice: userChoice, answers: answer);

          return FResult.success({'myScore': score, 'totalScore': maxScore});

        case AppPaths.mutipleChoiceAnswerScreen:
          final answers = lesson.questionGroup.questions.first.answer;

          final maxScore = answers.length;
          final score = CalculatorScore.multipleAnswerScore(
              userChoice: doScore.answers, answers: answers);

          return FResult.success({'myScore': score, 'totalScore': maxScore});
        case AppPaths.highlightIncorrectWord:
          final options = lesson.questionGroup.questions.first.options;

          final maxScore = options.length;
          final score = CalculatorScore.highlightIncorrectScore(
              userChoice: doScore.answers, options: options);

          return FResult.success({'myScore': score, 'totalScore': maxScore});
        case AppPaths.reOrderParagraph:
          final answers = lesson.questionGroup.questions.first.answer;

          final maxScore = answers.length;
          final score = CalculatorScore.reOrderParagraphScore(
              userChoice: doScore.answers, answers: answers);

          return FResult.success({'myScore': score, 'totalScore': maxScore});
        case AppPaths.fillInBlanks:
          return FResult.success(manyQuestionsScore(lesson, doScore));
        default:
          return FResult.error('Not found category to do score');
      }
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Map<String, int> manyQuestionsScore(DetailLesson lesson, DoScore doScore) {
    final answers = lesson.questionGroup.questions
        .map((e) => e.answer)
        .expand((element) => element)
        .toList();

    final maxScore = answers.length;
    final score = CalculatorScore.manyQuestionsScore(
        userChoice: doScore.answers, answers: answers);
    return {'myScore': score, 'totalScore': maxScore};
  }

  @override
  Future<FResult<String>> uploadNewResultDoScoreUser() {
    throw UnimplementedError();
  }
}
