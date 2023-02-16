import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/detail_lesson.dart';

enum FilterMarkEnum {
  allMark,
  red,
  grey;

  static FilterMarkEnum? tryParse(String value) {
    switch (value) {
      case 'Red':
        return FilterMarkEnum.red;
      case 'Grey':
        return FilterMarkEnum.grey;
      case 'All mark':
        return FilterMarkEnum.allMark;

      default:
    }
    return null;
  }

  @override
  String toString() {
    switch (this) {
      case FilterMarkEnum.red:
        return 'Red';
      case FilterMarkEnum.grey:
        return 'Grey';
      case FilterMarkEnum.allMark:
        return 'All mark';
    }
  }
}

enum FilterPracticedEnum {
  practiced;

  static FilterPracticedEnum? tryParse(String value) {
    switch (value) {
      case 'Practiced':
        return FilterPracticedEnum.practiced;
      default:
    }
    return null;
  }

  @override
  String toString() {
    switch (this) {
      case FilterPracticedEnum.practiced:
        return 'Practiced';
    }
  }
}

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
