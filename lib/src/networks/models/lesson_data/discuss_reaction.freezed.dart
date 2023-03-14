// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discuss_reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DiscussReaction _$DiscussReactionFromJson(Map<String, dynamic> json) {
  return _DiscussReaction.fromJson(json);
}

/// @nodoc
mixin _$DiscussReaction {
  String get uid => throw _privateConstructorUsedError;
  String get reaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DiscussReactionCopyWith<DiscussReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscussReactionCopyWith<$Res> {
  factory $DiscussReactionCopyWith(
          DiscussReaction value, $Res Function(DiscussReaction) then) =
      _$DiscussReactionCopyWithImpl<$Res, DiscussReaction>;
  @useResult
  $Res call({String uid, String reaction});
}

/// @nodoc
class _$DiscussReactionCopyWithImpl<$Res, $Val extends DiscussReaction>
    implements $DiscussReactionCopyWith<$Res> {
  _$DiscussReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? reaction = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscussReactionCopyWith<$Res>
    implements $DiscussReactionCopyWith<$Res> {
  factory _$$_DiscussReactionCopyWith(
          _$_DiscussReaction value, $Res Function(_$_DiscussReaction) then) =
      __$$_DiscussReactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uid, String reaction});
}

/// @nodoc
class __$$_DiscussReactionCopyWithImpl<$Res>
    extends _$DiscussReactionCopyWithImpl<$Res, _$_DiscussReaction>
    implements _$$_DiscussReactionCopyWith<$Res> {
  __$$_DiscussReactionCopyWithImpl(
      _$_DiscussReaction _value, $Res Function(_$_DiscussReaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? reaction = null,
  }) {
    return _then(_$_DiscussReaction(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      reaction: null == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DiscussReaction implements _DiscussReaction {
  _$_DiscussReaction({required this.uid, required this.reaction});

  factory _$_DiscussReaction.fromJson(Map<String, dynamic> json) =>
      _$$_DiscussReactionFromJson(json);

  @override
  final String uid;
  @override
  final String reaction;

  @override
  String toString() {
    return 'DiscussReaction(uid: $uid, reaction: $reaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscussReaction &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uid, reaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscussReactionCopyWith<_$_DiscussReaction> get copyWith =>
      __$$_DiscussReactionCopyWithImpl<_$_DiscussReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DiscussReactionToJson(
      this,
    );
  }
}

abstract class _DiscussReaction implements DiscussReaction {
  factory _DiscussReaction(
      {required final String uid,
      required final String reaction}) = _$_DiscussReaction;

  factory _DiscussReaction.fromJson(Map<String, dynamic> json) =
      _$_DiscussReaction.fromJson;

  @override
  String get uid;
  @override
  String get reaction;
  @override
  @JsonKey(ignore: true)
  _$$_DiscussReactionCopyWith<_$_DiscussReaction> get copyWith =>
      throw _privateConstructorUsedError;
}
