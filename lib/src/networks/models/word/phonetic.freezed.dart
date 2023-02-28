// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phonetic.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Phonetic _$PhoneticFromJson(Map<String, dynamic> json) {
  return _Phonetic.fromJson(json);
}

/// @nodoc
mixin _$Phonetic {
  String? get text => throw _privateConstructorUsedError;
  String? get audio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneticCopyWith<Phonetic> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneticCopyWith<$Res> {
  factory $PhoneticCopyWith(Phonetic value, $Res Function(Phonetic) then) =
      _$PhoneticCopyWithImpl<$Res, Phonetic>;
  @useResult
  $Res call({String? text, String? audio});
}

/// @nodoc
class _$PhoneticCopyWithImpl<$Res, $Val extends Phonetic>
    implements $PhoneticCopyWith<$Res> {
  _$PhoneticCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? audio = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PhoneticCopyWith<$Res> implements $PhoneticCopyWith<$Res> {
  factory _$$_PhoneticCopyWith(
          _$_Phonetic value, $Res Function(_$_Phonetic) then) =
      __$$_PhoneticCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? audio});
}

/// @nodoc
class __$$_PhoneticCopyWithImpl<$Res>
    extends _$PhoneticCopyWithImpl<$Res, _$_Phonetic>
    implements _$$_PhoneticCopyWith<$Res> {
  __$$_PhoneticCopyWithImpl(
      _$_Phonetic _value, $Res Function(_$_Phonetic) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? audio = freezed,
  }) {
    return _then(_$_Phonetic(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      audio: freezed == audio
          ? _value.audio
          : audio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Phonetic implements _Phonetic {
  _$_Phonetic({this.text, this.audio});

  factory _$_Phonetic.fromJson(Map<String, dynamic> json) =>
      _$$_PhoneticFromJson(json);

  @override
  final String? text;
  @override
  final String? audio;

  @override
  String toString() {
    return 'Phonetic(text: $text, audio: $audio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Phonetic &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.audio, audio) || other.audio == audio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, audio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PhoneticCopyWith<_$_Phonetic> get copyWith =>
      __$$_PhoneticCopyWithImpl<_$_Phonetic>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PhoneticToJson(
      this,
    );
  }
}

abstract class _Phonetic implements Phonetic {
  factory _Phonetic({final String? text, final String? audio}) = _$_Phonetic;

  factory _Phonetic.fromJson(Map<String, dynamic> json) = _$_Phonetic.fromJson;

  @override
  String? get text;
  @override
  String? get audio;
  @override
  @JsonKey(ignore: true)
  _$$_PhoneticCopyWith<_$_Phonetic> get copyWith =>
      throw _privateConstructorUsedError;
}
