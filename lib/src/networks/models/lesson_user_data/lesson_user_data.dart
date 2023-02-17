import 'package:freezed_annotation/freezed_annotation.dart';

part 'lesson_user_data.freezed.dart';
part 'lesson_user_data.g.dart';

@freezed
class LessonUserData with _$LessonUserData {
  factory LessonUserData({
    required String id,
    @JsonKey(name: 'id_category') required String idCategory,
    required String mark,
    required int practiced,
  }) = _LessonUserData;

  factory LessonUserData.fromJson(Map<String, Object?> json) =>
      _$LessonUserDataFromJson(json);
}
