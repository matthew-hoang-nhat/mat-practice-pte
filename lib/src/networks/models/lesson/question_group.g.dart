// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuestionGroup _$$_QuestionGroupFromJson(Map<String, dynamic> json) =>
    _$_QuestionGroup(
      preQuestion: json['preQuestion'] as String?,
      questions: (json['questions'] as List<dynamic>)
          .map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuestionGroupToJson(_$_QuestionGroup instance) =>
    <String, dynamic>{
      'preQuestion': instance.preQuestion,
      'questions': instance.questions,
    };
