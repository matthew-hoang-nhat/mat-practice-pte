// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'm_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MUser _$$_MUserFromJson(Map<String, dynamic> json) => _$_MUser(
      uid: json['uid'] as String,
      nickname: json['nickname'] as String,
      avatarUrl: json['avatarUrl'] as String?,
      email: json['email'] as String,
      userPractice: json['userPractice'] == null
          ? null
          : MUserPractice.fromJson(
              json['userPractice'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_MUserToJson(_$_MUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'nickname': instance.nickname,
      'avatarUrl': instance.avatarUrl,
      'email': instance.email,
      'userPractice': instance.userPractice,
    };
