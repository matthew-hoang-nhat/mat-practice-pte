// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MUser _$MUserFromJson(Map<String, dynamic> json) {
  return _MUser.fromJson(json);
}

/// @nodoc
mixin _$MUser {
  String get uid => throw _privateConstructorUsedError;
  String get nickname => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  MUserPractice? get userPractice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MUserCopyWith<MUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUserCopyWith<$Res> {
  factory $MUserCopyWith(MUser value, $Res Function(MUser) then) =
      _$MUserCopyWithImpl<$Res, MUser>;
  @useResult
  $Res call(
      {String uid,
      String nickname,
      String? avatarUrl,
      String email,
      MUserPractice? userPractice});

  $MUserPracticeCopyWith<$Res>? get userPractice;
}

/// @nodoc
class _$MUserCopyWithImpl<$Res, $Val extends MUser>
    implements $MUserCopyWith<$Res> {
  _$MUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? nickname = null,
    Object? avatarUrl = freezed,
    Object? email = null,
    Object? userPractice = freezed,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userPractice: freezed == userPractice
          ? _value.userPractice
          : userPractice // ignore: cast_nullable_to_non_nullable
              as MUserPractice?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MUserPracticeCopyWith<$Res>? get userPractice {
    if (_value.userPractice == null) {
      return null;
    }

    return $MUserPracticeCopyWith<$Res>(_value.userPractice!, (value) {
      return _then(_value.copyWith(userPractice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MUserCopyWith<$Res> implements $MUserCopyWith<$Res> {
  factory _$$_MUserCopyWith(_$_MUser value, $Res Function(_$_MUser) then) =
      __$$_MUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String nickname,
      String? avatarUrl,
      String email,
      MUserPractice? userPractice});

  @override
  $MUserPracticeCopyWith<$Res>? get userPractice;
}

/// @nodoc
class __$$_MUserCopyWithImpl<$Res> extends _$MUserCopyWithImpl<$Res, _$_MUser>
    implements _$$_MUserCopyWith<$Res> {
  __$$_MUserCopyWithImpl(_$_MUser _value, $Res Function(_$_MUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? nickname = null,
    Object? avatarUrl = freezed,
    Object? email = null,
    Object? userPractice = freezed,
  }) {
    return _then(_$_MUser(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      nickname: null == nickname
          ? _value.nickname
          : nickname // ignore: cast_nullable_to_non_nullable
              as String,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userPractice: freezed == userPractice
          ? _value.userPractice
          : userPractice // ignore: cast_nullable_to_non_nullable
              as MUserPractice?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MUser implements _MUser {
  _$_MUser(
      {required this.uid,
      required this.nickname,
      this.avatarUrl,
      required this.email,
      this.userPractice});

  factory _$_MUser.fromJson(Map<String, dynamic> json) =>
      _$$_MUserFromJson(json);

  @override
  final String uid;
  @override
  final String nickname;
  @override
  final String? avatarUrl;
  @override
  final String email;
  @override
  final MUserPractice? userPractice;

  @override
  String toString() {
    return 'MUser(uid: $uid, nickname: $nickname, avatarUrl: $avatarUrl, email: $email, userPractice: $userPractice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MUser &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userPractice, userPractice) ||
                other.userPractice == userPractice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, nickname, avatarUrl, email, userPractice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MUserCopyWith<_$_MUser> get copyWith =>
      __$$_MUserCopyWithImpl<_$_MUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MUserToJson(
      this,
    );
  }
}

abstract class _MUser implements MUser {
  factory _MUser(
      {required final String uid,
      required final String nickname,
      final String? avatarUrl,
      required final String email,
      final MUserPractice? userPractice}) = _$_MUser;

  factory _MUser.fromJson(Map<String, dynamic> json) = _$_MUser.fromJson;

  @override
  String get uid;
  @override
  String get nickname;
  @override
  String? get avatarUrl;
  @override
  String get email;
  @override
  MUserPractice? get userPractice;
  @override
  @JsonKey(ignore: true)
  _$$_MUserCopyWith<_$_MUser> get copyWith =>
      throw _privateConstructorUsedError;
}
