// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:freezed_annotation/freezed_annotation.dart';

import 'm_user_practice.dart';
part 'm_user.freezed.dart';
part 'm_user.g.dart';

@freezed
class MUser with _$MUser {
  factory MUser({
    required String uid,
    required String nickname,
    String? avatarUrl,
    required String email,
    MUserPractice? userPractice,
  }) = _MUser;

  factory MUser.fromJson(Map<String, Object?> json) => _$MUserFromJson(json);
}
