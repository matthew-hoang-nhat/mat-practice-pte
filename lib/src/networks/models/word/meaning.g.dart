// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Meaning _$$_MeaningFromJson(Map<String, dynamic> json) => _$_Meaning(
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
      partOfSpeech: json['partOfSpeech'] as String?,
    );

Map<String, dynamic> _$$_MeaningToJson(_$_Meaning instance) =>
    <String, dynamic>{
      'definitions': instance.definitions,
      'partOfSpeech': instance.partOfSpeech,
    };
