import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';

abstract class LessonUserDataRepository {
  Future<FResult<List<LessonUserData>>> getUserLessons(
      {required String idCategory,
      required FilterMarkEnum? filterMark,
      required FilterPracticedEnum? filterPracticed,
      required FetchArrowType fetchArrowType,
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
