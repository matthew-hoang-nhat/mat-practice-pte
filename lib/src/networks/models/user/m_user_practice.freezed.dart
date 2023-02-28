// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_user_practice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MUserPractice _$MUserPracticeFromJson(Map<String, dynamic> json) {
  return _MUserPractice.fromJson(json);
}

/// @nodoc
mixin _$MUserPractice {
  int get todayPracticed => throw _privateConstructorUsedError;
  int get totalPracticed => throw _privateConstructorUsedError;
  int get pracDays => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MUserPracticeCopyWith<MUserPractice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MUserPracticeCopyWith<$Res> {
  factory $MUserPracticeCopyWith(
          MUserPractice value, $Res Function(MUserPractice) then) =
      _$MUserPracticeCopyWithImpl<$Res, MUserPractice>;
  @useResult
  $Res call({int todayPracticed, int totalPracticed, int pracDays});
}

/// @nodoc
class _$MUserPracticeCopyWithImpl<$Res, $Val extends MUserPractice>
    implements $MUserPracticeCopyWith<$Res> {
  _$MUserPracticeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayPracticed = null,
    Object? totalPracticed = null,
    Object? pracDays = null,
  }) {
    return _then(_value.copyWith(
      todayPracticed: null == todayPracticed
          ? _value.todayPracticed
          : todayPracticed // ignore: cast_nullable_to_non_nullable
              as int,
      totalPracticed: null == totalPracticed
          ? _value.totalPracticed
          : totalPracticed // ignore: cast_nullable_to_non_nullable
              as int,
      pracDays: null == pracDays
          ? _value.pracDays
          : pracDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MUserPracticeCopyWith<$Res>
    implements $MUserPracticeCopyWith<$Res> {
  factory _$$_MUserPracticeCopyWith(
          _$_MUserPractice value, $Res Function(_$_MUserPractice) then) =
      __$$_MUserPracticeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int todayPracticed, int totalPracticed, int pracDays});
}

/// @nodoc
class __$$_MUserPracticeCopyWithImpl<$Res>
    extends _$MUserPracticeCopyWithImpl<$Res, _$_MUserPractice>
    implements _$$_MUserPracticeCopyWith<$Res> {
  __$$_MUserPracticeCopyWithImpl(
      _$_MUserPractice _value, $Res Function(_$_MUserPractice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? todayPracticed = null,
    Object? totalPracticed = null,
    Object? pracDays = null,
  }) {
    return _then(_$_MUserPractice(
      todayPracticed: null == todayPracticed
          ? _value.todayPracticed
          : todayPracticed // ignore: cast_nullable_to_non_nullable
              as int,
      totalPracticed: null == totalPracticed
          ? _value.totalPracticed
          : totalPracticed // ignore: cast_nullable_to_non_nullable
              as int,
      pracDays: null == pracDays
          ? _value.pracDays
          : pracDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MUserPractice implements _MUserPractice {
  _$_MUserPractice(
      {this.todayPracticed = 0, this.totalPracticed = 0, this.pracDays = 0});

  factory _$_MUserPractice.fromJson(Map<String, dynamic> json) =>
      _$$_MUserPracticeFromJson(json);

  @override
  @JsonKey()
  final int todayPracticed;
  @override
  @JsonKey()
  final int totalPracticed;
  @override
  @JsonKey()
  final int pracDays;

  @override
  String toString() {
    return 'MUserPractice(todayPracticed: $todayPracticed, totalPracticed: $totalPracticed, pracDays: $pracDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MUserPractice &&
            (identical(other.todayPracticed, todayPracticed) ||
                other.todayPracticed == todayPracticed) &&
            (identical(other.totalPracticed, totalPracticed) ||
                other.totalPracticed == totalPracticed) &&
            (identical(other.pracDays, pracDays) ||
                other.pracDays == pracDays));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, todayPracticed, totalPracticed, pracDays);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MUserPracticeCopyWith<_$_MUserPractice> get copyWith =>
      __$$_MUserPracticeCopyWithImpl<_$_MUserPractice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MUserPracticeToJson(
      this,
    );
  }
}

abstract class _MUserPractice implements MUserPractice {
  factory _MUserPractice(
      {final int todayPracticed,
      final int totalPracticed,
      final int pracDays}) = _$_MUserPractice;

  factory _MUserPractice.fromJson(Map<String, dynamic> json) =
      _$_MUserPractice.fromJson;

  @override
  int get todayPracticed;
  @override
  int get totalPracticed;
  @override
  int get pracDays;
  @override
  @JsonKey(ignore: true)
  _$$_MUserPracticeCopyWith<_$_MUserPractice> get copyWith =>
      throw _privateConstructorUsedError;
}
