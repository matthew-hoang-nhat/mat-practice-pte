// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

import 'question.dart';
part 'question_group.freezed.dart';
part 'question_group.g.dart';

@freezed
class QuestionGroup with _$QuestionGroup {
  factory QuestionGroup({
    String? preQuestion,
    required List<Question> questions,
  }) = _QuestionGroup;

  factory QuestionGroup.fromJson(Map<String, Object?> json) =>
      _$QuestionGroupFromJson(json);
}
