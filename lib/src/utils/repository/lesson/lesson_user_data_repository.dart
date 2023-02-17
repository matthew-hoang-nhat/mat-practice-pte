import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/detail_lesson.dart';

import '../../remote/models/lesson_user_data/lesson_user_data.dart';

abstract class LessonUserDataRepository {
  Future<FResult<List<LessonUserData>>> getUserLessons(
      {required String idCategory,
      required FilterMarkEnum? filterMark,
      required FilterPracticedEnum? filterPracticed,
      required bool isQNumDescending,
      String? lastIdLesson});

  Future<FResult<LessonUserData>> getLessonUserData({
    required String idLesson,
    required String idCategory,
  });

  Future<FResult<int>> getCountFoundLessonWithFilter(
      {required String idCategory,
      FilterMarkEnum? filterMark,
      FilterPracticedEnum? filterPracticed});
}
