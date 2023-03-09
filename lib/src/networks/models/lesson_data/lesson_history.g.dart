// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonHistory _$$_LessonHistoryFromJson(Map<String, dynamic> json) =>
    _$_LessonHistory(
      id: json['id'] as String?,
      idCategory: json['idCategory'] as String,
      idLesson: json['idLesson'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
      myScore: json['myScore'] as int,
      maxScore: json['maxScore'] as int,
      timeCreated: json['timeCreated'] as int,
      uid: json['uid'] as String,
    );

Map<String, dynamic> _$$_LessonHistoryToJson(_$_LessonHistory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCategory': instance.idCategory,
      'idLesson': instance.idLesson,
      'answers': instance.answers,
      'myScore': instance.myScore,
      'maxScore': instance.maxScore,
      'timeCreated': instance.timeCreated,
      'uid': instance.uid,
    };
