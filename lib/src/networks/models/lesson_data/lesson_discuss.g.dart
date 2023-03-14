// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_discuss.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LessonDiscuss _$$_LessonDiscussFromJson(Map<String, dynamic> json) =>
    _$_LessonDiscuss(
      idCategory: json['idCategory'] as String,
      idLesson: json['idLesson'] as String,
      idParent: json['idParent'] as String?,
      content: json['content'] as String,
      uid: json['uid'] as String,
      avatar: json['avatar'] as String?,
      username: json['username'] as String?,
      id: json['id'] as String?,
      reactions: (json['reactions'] as List<dynamic>)
          .map((e) => DiscussReaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      replies: (json['replies'] as List<dynamic>)
          .map((e) => LessonDiscuss.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_LessonDiscussToJson(_$_LessonDiscuss instance) =>
    <String, dynamic>{
      'idCategory': instance.idCategory,
      'idLesson': instance.idLesson,
      'idParent': instance.idParent,
      'content': instance.content,
      'uid': instance.uid,
      'avatar': instance.avatar,
      'username': instance.username,
      'id': instance.id,
      'reactions': instance.reactions.map((e) => e.toJson()).toList(),
      'replies': instance.replies.map((e) => e.toJson()).toList(),
    };
