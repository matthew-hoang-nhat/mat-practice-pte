import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';

abstract class LessonHistoryRepository {
  Future<FResult<List<LessonHistory>>> getLessonHistories(
      String uid, String idCategory, String idLesson,
      {String? idLastHistory});
  Future<FResult<String>> removeLessonHistory(String id);
}
