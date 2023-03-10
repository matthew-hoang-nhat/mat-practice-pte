import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_user_data.freezed.dart';
part 'lesson_user_data.g.dart';

@freezed
class LessonUserData with _$LessonUserData {
  factory LessonUserData({
    required String uid,
    required String idLesson,
    required String idCategory,
    required String? codeMark,
    @Default(0) int countPracticed,
  }) = _LessonUserData;

  factory LessonUserData.fromJson(Map<String, Object?> json) =>
      _$LessonUserDataFromJson(json);
}
