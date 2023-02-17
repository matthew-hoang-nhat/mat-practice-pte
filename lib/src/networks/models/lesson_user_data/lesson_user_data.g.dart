// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_user_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonUserData _$$_LessonUserDataFromJson(Map<String, dynamic> json) =>
    _$_LessonUserData(
      id: json['id'] as String,
      idCategory: json['id_category'] as String,
      mark: json['mark'] as String,
      practiced: json['practiced'] as int,
    );

Map<String, dynamic> _$$_LessonUserDataToJson(_$_LessonUserData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_category': instance.idCategory,
      'mark': instance.mark,
      'practiced': instance.practiced,
    };
