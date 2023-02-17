// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../remote/f_result.dart';
import '../../remote/models/detail_lesson.dart';

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
