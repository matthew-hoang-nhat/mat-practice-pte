// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'f_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FCategory _$FCategoryFromJson(Map<String, dynamic> json) {
  return _FCategory.fromJson(json);
}

/// @nodoc
mixin _$FCategory {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get codeName => throw _privateConstructorUsedError;
  String get hexCodeColor => throw _privateConstructorUsedError;
  int get foundLesson => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FCategoryCopyWith<FCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FCategoryCopyWith<$Res> {
  factory $FCategoryCopyWith(FCategory value, $Res Function(FCategory) then) =
      _$FCategoryCopyWithImpl<$Res, FCategory>;
  @useResult
  $Res call(
      {String id,
      String name,
      String codeName,
      String hexCodeColor,
      int foundLesson});
}

/// @nodoc
class _$FCategoryCopyWithImpl<$Res, $Val extends FCategory>
    implements $FCategoryCopyWith<$Res> {
  _$FCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? codeName = null,
    Object? hexCodeColor = null,
    Object? foundLesson = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      codeName: null == codeName
          ? _value.codeName
          : codeName // ignore: cast_nullable_to_non_nullable
              as String,
      hexCodeColor: null == hexCodeColor
          ? _value.hexCodeColor
          : hexCodeColor // ignore: cast_nullable_to_non_nullable
              as String,
      foundLesson: null == foundLesson
          ? _value.foundLesson
          : foundLesson // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FCategoryCopyWith<$Res> implements $FCategoryCopyWith<$Res> {
  factory _$$_FCategoryCopyWith(
          _$_FCategory value, $Res Function(_$_FCategory) then) =
      __$$_FCategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String codeName,
      String hexCodeColor,
      int foundLesson});
}

/// @nodoc
class __$$_FCategoryCopyWithImpl<$Res>
    extends _$FCategoryCopyWithImpl<$Res, _$_FCategory>
    implements _$$_FCategoryCopyWith<$Res> {
  __$$_FCategoryCopyWithImpl(
      _$_FCategory _value, $Res Function(_$_FCategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? codeName = null,
    Object? hexCodeColor = null,
    Object? foundLesson = null,
  }) {
    return _then(_$_FCategory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      codeName: null == codeName
          ? _value.codeName
          : codeName // ignore: cast_nullable_to_non_nullable
              as String,
      hexCodeColor: null == hexCodeColor
          ? _value.hexCodeColor
          : hexCodeColor // ignore: cast_nullable_to_non_nullable
              as String,
      foundLesson: null == foundLesson
          ? _value.foundLesson
          : foundLesson // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FCategory implements _FCategory {
  _$_FCategory(
      {required this.id,
      required this.name,
      required this.codeName,
      required this.hexCodeColor,
      required this.foundLesson});

  factory _$_FCategory.fromJson(Map<String, dynamic> json) =>
      _$$_FCategoryFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String codeName;
  @override
  final String hexCodeColor;
  @override
  final int foundLesson;

  @override
  String toString() {
    return 'FCategory(id: $id, name: $name, codeName: $codeName, hexCodeColor: $hexCodeColor, foundLesson: $foundLesson)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FCategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.codeName, codeName) ||
                other.codeName == codeName) &&
            (identical(other.hexCodeColor, hexCodeColor) ||
                other.hexCodeColor == hexCodeColor) &&
            (identical(other.foundLesson, foundLesson) ||
                other.foundLesson == foundLesson));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, codeName, hexCodeColor, foundLesson);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FCategoryCopyWith<_$_FCategory> get copyWith =>
      __$$_FCategoryCopyWithImpl<_$_FCategory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FCategoryToJson(
      this,
    );
  }
}

abstract class _FCategory implements FCategory {
  factory _FCategory(
      {required final String id,
      required final String name,
      required final String codeName,
      required final String hexCodeColor,
      required final int foundLesson}) = _$_FCategory;

  factory _FCategory.fromJson(Map<String, dynamic> json) =
      _$_FCategory.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get codeName;
  @override
  String get hexCodeColor;
  @override
  int get foundLesson;
  @override
  @JsonKey(ignore: true)
  _$$_FCategoryCopyWith<_$_FCategory> get copyWith =>
      throw _privateConstructorUsedError;
}
