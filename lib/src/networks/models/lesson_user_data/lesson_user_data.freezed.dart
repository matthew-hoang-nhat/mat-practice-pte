// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lesson_user_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LessonUserData _$LessonUserDataFromJson(Map<String, dynamic> json) {
  return _LessonUserData.fromJson(json);
}

/// @nodoc
mixin _$LessonUserData {
  String get uid => throw _privateConstructorUsedError;
  String get idLesson => throw _privateConstructorUsedError;
  String get idCategory => throw _privateConstructorUsedError;
  String? get codeMark => throw _privateConstructorUsedError;
  int get countPracticed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LessonUserDataCopyWith<LessonUserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LessonUserDataCopyWith<$Res> {
  factory $LessonUserDataCopyWith(
          LessonUserData value, $Res Function(LessonUserData) then) =
      _$LessonUserDataCopyWithImpl<$Res, LessonUserData>;
  @useResult
  $Res call(
      {String uid,
      String idLesson,
      String idCategory,
      String? codeMark,
      int countPracticed});
}

/// @nodoc
class _$LessonUserDataCopyWithImpl<$Res, $Val extends LessonUserData>
    implements $LessonUserDataCopyWith<$Res> {
  _$LessonUserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? idLesson = null,
    Object? idCategory = null,
    Object? codeMark = freezed,
    Object? countPracticed = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      idLesson: null == idLesson
          ? _value.idLesson
          : idLesson // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      codeMark: freezed == codeMark
          ? _value.codeMark
          : codeMark // ignore: cast_nullable_to_non_nullable
              as String?,
      countPracticed: null == countPracticed
          ? _value.countPracticed
          : countPracticed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LessonUserDataCopyWith<$Res>
    implements $LessonUserDataCopyWith<$Res> {
  factory _$$_LessonUserDataCopyWith(
          _$_LessonUserData value, $Res Function(_$_LessonUserData) then) =
      __$$_LessonUserDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String idLesson,
      String idCategory,
      String? codeMark,
      int countPracticed});
}

/// @nodoc
class __$$_LessonUserDataCopyWithImpl<$Res>
    extends _$LessonUserDataCopyWithImpl<$Res, _$_LessonUserData>
    implements _$$_LessonUserDataCopyWith<$Res> {
  __$$_LessonUserDataCopyWithImpl(
      _$_LessonUserData _value, $Res Function(_$_LessonUserData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? idLesson = null,
    Object? idCategory = null,
    Object? codeMark = freezed,
    Object? countPracticed = null,
  }) {
    return _then(_$_LessonUserData(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      idLesson: null == idLesson
          ? _value.idLesson
          : idLesson // ignore: cast_nullable_to_non_nullable
              as String,
      idCategory: null == idCategory
          ? _value.idCategory
          : idCategory // ignore: cast_nullable_to_non_nullable
              as String,
      codeMark: freezed == codeMark
          ? _value.codeMark
          : codeMark // ignore: cast_nullable_to_non_nullable
              as String?,
      countPracticed: null == countPracticed
          ? _value.countPracticed
          : countPracticed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LessonUserData implements _LessonUserData {
  _$_LessonUserData(
      {required this.uid,
      required this.idLesson,
      required this.idCategory,
      required this.codeMark,
      this.countPracticed = 0});

  factory _$_LessonUserData.fromJson(Map<String, dynamic> json) =>
      _$$_LessonUserDataFromJson(json);

  @override
  final String uid;
  @override
  final String idLesson;
  @override
  final String idCategory;
  @override
  final String? codeMark;
  @override
  @JsonKey()
  final int countPracticed;

  @override
  String toString() {
    return 'LessonUserData(uid: $uid, idLesson: $idLesson, idCategory: $idCategory, codeMark: $codeMark, countPracticed: $countPracticed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LessonUserData &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.idLesson, idLesson) ||
                other.idLesson == idLesson) &&
            (identical(other.idCategory, idCategory) ||
                other.idCategory == idCategory) &&
            (identical(other.codeMark, codeMark) ||
                other.codeMark == codeMark) &&
            (identical(other.countPracticed, countPracticed) ||
                other.countPracticed == countPracticed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, uid, idLesson, idCategory, codeMark, countPracticed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LessonUserDataCopyWith<_$_LessonUserData> get copyWith =>
      __$$_LessonUserDataCopyWithImpl<_$_LessonUserData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LessonUserDataToJson(
      this,
    );
  }
}

abstract class _LessonUserData implements LessonUserData {
  factory _LessonUserData(
      {required final String uid,
      required final String idLesson,
      required final String idCategory,
      required final String? codeMark,
      final int countPracticed}) = _$_LessonUserData;

  factory _LessonUserData.fromJson(Map<String, dynamic> json) =
      _$_LessonUserData.fromJson;

  @override
  String get uid;
  @override
  String get idLesson;
  @override
  String get idCategory;
  @override
  String? get codeMark;
  @override
  int get countPracticed;
  @override
  @JsonKey(ignore: true)
  _$$_LessonUserDataCopyWith<_$_LessonUserData> get copyWith =>
      throw _privateConstructorUsedError;
}
