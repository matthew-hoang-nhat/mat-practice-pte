// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MUser {
  final String uid;
  final String nickname;
  final String? avatarUrl;
  final String email;

  MUser({
    required this.uid,
    required this.nickname,
    this.avatarUrl,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'nickname': nickname,
      'avatarUrl': avatarUrl,
      'email': email,
    };
  }

  factory MUser.fromMap(Map<String, dynamic> map) {
    return MUser(
      uid: map['uid'] as String,
      nickname: map['nickname'] as String,
      avatarUrl: map['avatarUrl'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MUser.fromJson(String source) =>
      MUser.fromMap(json.decode(source) as Map<String, dynamic>);

  MUser copyWith({
    String? uid,
    String? nickname,
    String? avatarUrl,
    String? email,
  }) {
    return MUser(
      uid: uid ?? this.uid,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: email ?? this.email,
    );
  }
}
