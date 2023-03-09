import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/server/calculator_score.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_history_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/raw_lesson_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';

import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

import 'server.dart';

class FServerImpl extends FServer {
  RawLessonCollectionReference lessonRef(String idCategory) =>
      RawLessonCollectionReference(idCategory);

  final historyRef = LessonHistoryCollectionReference();
  final fWidgets = GlobalVariables.getIt<FApp>();
  String? get uid => GlobalVariables.auth.currentUser?.uid;
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

      int score = -1;
      int maxScore = -1;

      switch (typeLesson) {
        case AppPaths.singleChoiceAnswerScreen:
        case AppPaths.listeningSingleChoiceAnswer:
        case AppPaths.highlightSummary:
        case AppPaths.selectMissingWord:
          final userChoice = doScore.answers.first;
          final answer = lesson.questionGroup.questions.first.answer.first;
          maxScore = 1;
          score = CalculatorScore.singleAnswerScore(
              userChoice: userChoice, answers: answer);
          break;

        case AppPaths.mutipleChoiceAnswerScreen:
        case AppPaths.listeningMultipleChoiceAnswer:
          final answers = lesson.questionGroup.questions.first.answer;
          maxScore = answers.length;
          score = CalculatorScore.multipleAnswerScore(
              userChoice: doScore.answers, answers: answers);
          break;

        case AppPaths.highlightIncorrectWord:
          final options = lesson.questionGroup.questions.first.options;
          maxScore = options.length;
          score = CalculatorScore.highlightIncorrectScore(
              userChoice: doScore.answers, options: options);
          break;

        case AppPaths.reOrderParagraph:
          final lessonAnswers = lesson.questionGroup.questions.first.answer;
          maxScore = lessonAnswers.length;
          score = CalculatorScore.reOrderParagraphScore(
              userChoice: doScore.answers, answers: lessonAnswers);
          break;

        case AppPaths.fillInBlanks:
        case AppPaths.fillInBlanksDragAndDrog:
        case AppPaths.fillInBlanksTextFields:
          final answers = lesson.questionGroup.questions
              .map((e) => e.answer)
              .expand((element) => element)
              .toList();

          maxScore = answers.length;
          score = CalculatorScore.manyQuestionsScore(
              userChoice: doScore.answers, answers: answers);
          break;
        default:
          return FResult.error('Not found category to do score');
      }

      historyRef.add(LessonHistory(
          idCategory: doScore.idCategory!,
          idLesson: doScore.idLesson,
          answers: doScore.answers,
          myScore: score,
          maxScore: maxScore,
          timeCreated:
              Timestamp.fromDate(DateTime.now()).microsecondsSinceEpoch,
          uid: uid!));

      return FResult.success({
        'myScore': score,
        'totalScore': maxScore,
      });
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  // @override
  // Future<FResult<String>> uploadNewResultDoScoreUser() {
  //   throw UnimplementedError();
  // }
}
