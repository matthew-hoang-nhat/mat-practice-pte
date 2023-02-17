// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_word.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MWord _$$_MWordFromJson(Map<String, dynamic> json) => _$_MWord(
      word: json['word'] as String,
      phonetics: (json['phonetics'] as List<dynamic>)
          .map((e) => Phonetic.fromJson(e as Map<String, dynamic>))
          .toList(),
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => Meaning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_MWordToJson(_$_MWord instance) => <String, dynamic>{
      'word': instance.word,
      'phonetics': instance.phonetics,
      'meanings': instance.meanings,
    };
