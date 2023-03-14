// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'do_score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DoScore _$$_DoScoreFromJson(Map<String, dynamic> json) => _$_DoScore(
      idCategory: json['idCategory'] as String?,
      idLesson: json['idLesson'] as String,
      answers:
          (json['answers'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_DoScoreToJson(_$_DoScore instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'idLesson': instance.idLesson,
      'answers': instance.answers,
    };
