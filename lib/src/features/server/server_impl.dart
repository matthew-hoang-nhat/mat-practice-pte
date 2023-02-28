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

      switch (typeLesson) {
        case AppPaths.singleChoiceAnswerScreen:
          final lessonResult = await lessonRef(doScore.idCategory!)
              .ref
              .where('id', isEqualTo: doScore.idLesson)
              .get();
          final lesson = lessonResult.docs.first.data();

          var score = 0;
          final answer = lesson.questionGroup.questions.first.answer;
          final maxScore = lesson.questionGroup.questions.length;
          if (answer.contains(doScore.answers.first)) {
            score++;
          }

          return FResult.success({'myScore': score, 'totalScore': maxScore});
        default:
          return FResult.error('Not found category to do score');
      }
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> uploadNewResultDoScoreUser() {
    throw UnimplementedError();
  }
}
