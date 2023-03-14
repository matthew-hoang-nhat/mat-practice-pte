import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';

abstract class LessonRepository {
  Future<FResult<DetailLesson>> getDetailLesson(
      {required String idCategory, required String idLesson});

  Future<FResult<List<DetailLesson>>> getLessons({
    required String idCategory,
    String? idLastLesson,
    FilterMarkEnum? filterMark,
    bool isQNumDescending,
    FilterPracticedEnum? filterPracticed,
  });

  Future<FResult<int>> getCountFoundLesson({
    required String idCategory,
    FilterMarkEnum? filterMark,
    FilterPracticedEnum? filterPracticed,
  });
}
