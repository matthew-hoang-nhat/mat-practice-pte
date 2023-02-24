import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';

import 'lesson_repository.dart';

abstract class RawLessonRepository {
  Future<FResult<DetailLesson>> getRawDetailLesson(
      {required String idCategory, required String idLesson});

  Future<FResult<int>> getRawCountFoundLesson({required String idCategory});

  Future<FResult<List<DetailLesson>>> getRawLessons({
    required String idCategory,
    String? lastIdLesson,
    required FetchArrowType fetchArrowType,
    required bool isQNumDescending,
  });
}
