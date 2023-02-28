// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'do_score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DoScore _$DoScoreFromJson(Map<String, dynamic> json) {
  return _DoScore.fromJson(json);
}

/// @nodoc
mixin _$DoScore {
  String? get idCategory => throw _privateConstructorUsedError;
  String get idLesson => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DoScoreCopyWith<DoScore> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DoScoreCopyWith<$Res> {
  factory $DoScoreCopyWith(DoScore value, $Res Function(DoScore) then) =
      _$DoScoreCopyWithImpl<$Res, DoScore>;
  @useResult
  $Res call({String? idCategory, String idLesson, List<String> answers});
}

/// @nodoc
class _$DoScoreCopyWithImpl<$Res, $Val extends DoScore>
    implements $DoScoreCopyWith<$Res> {
  _$DoScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = freezed,
    Object? idLesson = null,
    Object? answers = null,
  }) {
    return _then(_value.copyWith(
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      idLesson: null == idLesson
          ? _value.idLesson
          : idLesson // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DoScoreCopyWith<$Res> implements $DoScoreCopyWith<$Res> {
  factory _$$_DoScoreCopyWith(
          _$_DoScore value, $Res Function(_$_DoScore) then) =
      __$$_DoScoreCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? idCategory, String idLesson, List<String> answers});
}

/// @nodoc
class __$$_DoScoreCopyWithImpl<$Res>
    extends _$DoScoreCopyWithImpl<$Res, _$_DoScore>
    implements _$$_DoScoreCopyWith<$Res> {
  __$$_DoScoreCopyWithImpl(_$_DoScore _value, $Res Function(_$_DoScore) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idCategory = freezed,
    Object? idLesson = null,
    Object? answers = null,
  }) {
    return _then(_$_DoScore(
      idCategory: freezed == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      idLesson: null == idLesson
          ? _value.idLesson
          : idLesson // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DoScore implements _DoScore {
  _$_DoScore(
      {this.idCategory,
      required this.idLesson,
      required final List<String> answers})
      : _answers = answers;

  factory _$_DoScore.fromJson(Map<String, dynamic> json) =>
      _$$_DoScoreFromJson(json);

  @override
  final String? idCategory;
  @override
  final String idLesson;
  final List<String> _answers;
  @override
  List<String> get answers {
    if (_answers is EqualUnmodifiableListView) return _answers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_answers);
  }

  @override
  String toString() {
    return 'DoScore(idCategory: $idCategory, idLesson: $idLesson, answers: $answers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DoScore &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.idLesson, idLesson) ||
                other.idLesson == idLesson) &&
            const DeepCollectionEquality().equals(other._answers, _answers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idCategory, idLesson,
      const DeepCollectionEquality().hash(_answers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DoScoreCopyWith<_$_DoScore> get copyWith =>
      __$$_DoScoreCopyWithImpl<_$_DoScore>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DoScoreToJson(
      this,
    );
  }
}

abstract class _DoScore implements DoScore {
  factory _DoScore(
      {final String? idCategory,
      required final String idLesson,
      required final List<String> answers}) = _$_DoScore;

  factory _DoScore.fromJson(Map<String, dynamic> json) = _$_DoScore.fromJson;

  @override
  String? get idCategory;
  @override
  String get idLesson;
  @override
  List<String> get answers;
  @override
  @JsonKey(ignore: true)
  _$$_DoScoreCopyWith<_$_DoScore> get copyWith =>
      throw _privateConstructorUsedError;
}
