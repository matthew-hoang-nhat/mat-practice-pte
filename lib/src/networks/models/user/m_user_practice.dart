import 'package:freezed_annotation/freezed_annotation.dart';
part 'm_user_practice.freezed.dart';
part 'm_user_practice.g.dart';

@freezed
class MUserPractice with _$MUserPractice {
  factory MUserPractice({
    @Default(0) int todayPracticed,
    @Default(0) int totalPracticed,
    @Default(0) int pracDays,
  }) = _MUserPractice;

  factory MUserPractice.fromJson(Map<String, Object?> json) =>
      _$MUserPracticeFromJson(json);
}
