// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonHistory _$LessonHistoryFromJson(Map<String, dynamic> json) {
  return _LessonHistory.fromJson(json);
}

/// @nodoc
mixin _$LessonHistory {
  String? get id => throw _privateConstructorUsedError;
  String get idCategory => throw _privateConstructorUsedError;
  String get idLesson => throw _privateConstructorUsedError;
  List<String> get answers => throw _privateConstructorUsedError;
  int get myScore => throw _privateConstructorUsedError;
  int get maxScore => throw _privateConstructorUsedError;
  int get timeCreated => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonHistoryCopyWith<LessonHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonHistoryCopyWith<$Res> {
  factory $LessonHistoryCopyWith(
          LessonHistory value, $Res Function(LessonHistory) then) =
      _$LessonHistoryCopyWithImpl<$Res, LessonHistory>;
  @useResult
  $Res call(
      {String? id,
      String idCategory,
      String idLesson,
      List<String> answers,
      int myScore,
      int maxScore,
      int timeCreated,
      String uid});
}

/// @nodoc
class _$LessonHistoryCopyWithImpl<$Res, $Val extends LessonHistory>
    implements $LessonHistoryCopyWith<$Res> {
  _$LessonHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idCategory = null,
    Object? idLesson = null,
    Object? answers = null,
    Object? myScore = null,
    Object? maxScore = null,
    Object? timeCreated = null,
    Object? uid = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      idLesson: null == idLesson
          ? _value.idLesson
          : idLesson // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value.answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      myScore: null == myScore
          ? _value.myScore
          : myScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      timeCreated: null == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LessonHistoryCopyWith<$Res>
    implements $LessonHistoryCopyWith<$Res> {
  factory _$$_LessonHistoryCopyWith(
          _$_LessonHistory value, $Res Function(_$_LessonHistory) then) =
      __$$_LessonHistoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String idCategory,
      String idLesson,
      List<String> answers,
      int myScore,
      int maxScore,
      int timeCreated,
      String uid});
}

/// @nodoc
class __$$_LessonHistoryCopyWithImpl<$Res>
    extends _$LessonHistoryCopyWithImpl<$Res, _$_LessonHistory>
    implements _$$_LessonHistoryCopyWith<$Res> {
  __$$_LessonHistoryCopyWithImpl(
      _$_LessonHistory _value, $Res Function(_$_LessonHistory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? idCategory = null,
    Object? idLesson = null,
    Object? answers = null,
    Object? myScore = null,
    Object? maxScore = null,
    Object? timeCreated = null,
    Object? uid = null,
  }) {
    return _then(_$_LessonHistory(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      idLesson: null == idLesson
          ? _value.idLesson
          : idLesson // ignore: cast_nullable_to_non_nullable
              as String,
      answers: null == answers
          ? _value._answers
          : answers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      myScore: null == myScore
          ? _value.myScore
          : myScore // ignore: cast_nullable_to_non_nullable
              as int,
      maxScore: null == maxScore
          ? _value.maxScore
          : maxScore // ignore: cast_nullable_to_non_nullable
              as int,
      timeCreated: null == timeCreated
          ? _value.timeCreated
          : timeCreated // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonHistory implements _LessonHistory {
  _$_LessonHistory(
      {this.id,
      required this.idCategory,
      required this.idLesson,
      required final List<String> answers,
      required this.myScore,
      required this.maxScore,
      required this.timeCreated,
      required this.uid})
      : _answers = answers;

  factory _$_LessonHistory.fromJson(Map<String, dynamic> json) =>
      _$$_LessonHistoryFromJson(json);

  @override
  final String? id;
  @override
  final String idCategory;
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
  final int myScore;
  @override
  final int maxScore;
  @override
  final int timeCreated;
  @override
  final String uid;

  @override
  String toString() {
    return 'LessonHistory(id: $id, idCategory: $idCategory, idLesson: $idLesson, answers: $answers, myScore: $myScore, maxScore: $maxScore, timeCreated: $timeCreated, uid: $uid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonHistory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.idLesson, idLesson) ||
                other.idLesson == idLesson) &&
            const DeepCollectionEquality().equals(other._answers, _answers) &&
            (identical(other.myScore, myScore) || other.myScore == myScore) &&
            (identical(other.maxScore, maxScore) ||
                other.maxScore == maxScore) &&
            (identical(other.timeCreated, timeCreated) ||
                other.timeCreated == timeCreated) &&
            (identical(other.uid, uid) || other.uid == uid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      idCategory,
      idLesson,
      const DeepCollectionEquality().hash(_answers),
      myScore,
      maxScore,
      timeCreated,
      uid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonHistoryCopyWith<_$_LessonHistory> get copyWith =>
      __$$_LessonHistoryCopyWithImpl<_$_LessonHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonHistoryToJson(
      this,
    );
  }
}

abstract class _LessonHistory implements LessonHistory {
  factory _LessonHistory(
      {final String? id,
      required final String idCategory,
      required final String idLesson,
      required final List<String> answers,
      required final int myScore,
      required final int maxScore,
      required final int timeCreated,
      required final String uid}) = _$_LessonHistory;

  factory _LessonHistory.fromJson(Map<String, dynamic> json) =
      _$_LessonHistory.fromJson;

  @override
  String? get id;
  @override
  String get idCategory;
  @override
  String get idLesson;
  @override
  List<String> get answers;
  @override
  int get myScore;
  @override
  int get maxScore;
  @override
  int get timeCreated;
  @override
  String get uid;
  @override
  @JsonKey(ignore: true)
  _$$_LessonHistoryCopyWith<_$_LessonHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
