import 'package:freezed_annotation/freezed_annotation.dart';
part 'lesson_history.freezed.dart';
part 'lesson_history.g.dart';

@freezed
class LessonHistory with _$LessonHistory {
  factory LessonHistory({
    String? id,
    required String idCategory,
    required String idLesson,
    required List<String> answers,
    required int myScore,
    required int maxScore,
    required int timeCreated,
    required String uid,
  }) = _LessonHistory;

  factory LessonHistory.fromJson(Map<String, Object?> json) =>
      _$LessonHistoryFromJson(json);
}
