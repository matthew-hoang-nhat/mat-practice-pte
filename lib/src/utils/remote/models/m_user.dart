// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:mat_practice_pte/src/utils/remote/models/m_user_practice.dart';

class MUser {
  final String uid;
  final String nickname;
  final String? avatarUrl;
  final String email;
  final MUserPractice? userPractice;

  MUser({
    required this.uid,
    required this.nickname,
    this.avatarUrl,
    required this.email,
    this.userPractice,
  });

  MUser copyWith({
    String? uid,
    String? nickname,
    String? avatarUrl,
    String? email,
    MUserPractice? userPractice,
  }) {
    return MUser(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
      userPractice: userPractice ?? this.userPractice,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'email': email,
      'userPractice': userPractice?.toMap(),
    };
  }

  factory MUser.fromMap(Map<String, dynamic> map) {
    return MUser(
      uid: map['uid'] as String,
      nickname: map['nickname'] as String,
      avatarUrl: map['avatarUrl'] != null ? map['avatarUrl'] as String : null,
      email: map['email'] as String,
      userPractice: map['userPractice'] != null
          ? MUserPractice.fromMap(map['userPractice'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MUser.fromJson(String source) =>
      MUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MUser(uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, email: $email, userPractice: $userPractice)';
  }

  @override
  bool operator ==(covariant MUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.nickname == nickname &&
        other.avatarUrl == avatarUrl &&
        other.email == email &&
        other.userPractice == userPractice;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        nickname.hashCode ^
        avatarUrl.hashCode ^
        email.hashCode ^
        userPractice.hashCode;
  }
}
