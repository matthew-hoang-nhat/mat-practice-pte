// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonUserData _$$_LessonUserDataFromJson(Map<String, dynamic> json) =>
    _$_LessonUserData(
      uid: json['uid'] as String,
      idLesson: json['idLesson'] as String,
      idCategory: json['idCategory'] as String,
      codeMark: json['codeMark'] as String?,
      countPracticed: json['countPracticed'] as int? ?? 0,
    );

Map<String, dynamic> _$$_LessonUserDataToJson(_$_LessonUserData instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'idLesson': instance.idLesson,
      'idCategory': instance.idCategory,
      'codeMark': instance.codeMark,
      'countPracticed': instance.countPracticed,
    };
