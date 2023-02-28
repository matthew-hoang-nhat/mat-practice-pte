// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'f_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FCategory _$$_FCategoryFromJson(Map<String, dynamic> json) => _$_FCategory(
      id: json['id'] as String,
      name: json['name'] as String,
      codeName: json['codeName'] as String,
      hexCodeColor: json['hexCodeColor'] as String,
      foundLesson: json['foundLesson'] as int,
    );

Map<String, dynamic> _$$_FCategoryToJson(_$_FCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'codeName': instance.codeName,
      'hexCodeColor': instance.hexCodeColor,
      'foundLesson': instance.foundLesson,
    };
