// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meaning.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meaning _$MeaningFromJson(Map<String, dynamic> json) => Meaning(
      definitions: (json['definitions'] as List<dynamic>?)
          ?.map((e) => Definition.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..partOfSpeech = json['partOfSpeech'] as String?;

Map<String, dynamic> _$MeaningToJson(Meaning instance) => <String, dynamic>{
      'definitions': instance.definitions,
      'partOfSpeech': instance.partOfSpeech,
    };
