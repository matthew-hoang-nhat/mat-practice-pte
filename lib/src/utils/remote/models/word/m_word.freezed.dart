// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'm_word.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MWord _$MWordFromJson(Map<String, dynamic> json) {
  return _MWord.fromJson(json);
}

/// @nodoc
mixin _$MWord {
  @JsonKey(name: 'word')
  String get word => throw _privateConstructorUsedError;
  @JsonKey(name: 'phonetics')
  List<Phonetic> get phonetics => throw _privateConstructorUsedError;
  @JsonKey(name: 'meanings')
  List<Meaning>? get meanings => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MWordCopyWith<MWord> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MWordCopyWith<$Res> {
  factory $MWordCopyWith(MWord value, $Res Function(MWord) then) =
      _$MWordCopyWithImpl<$Res, MWord>;
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String word,
      @JsonKey(name: 'phonetics') List<Phonetic> phonetics,
      @JsonKey(name: 'meanings') List<Meaning>? meanings});
}

/// @nodoc
class _$MWordCopyWithImpl<$Res, $Val extends MWord>
    implements $MWordCopyWith<$Res> {
  _$MWordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? phonetics = null,
    Object? meanings = freezed,
  }) {
    return _then(_value.copyWith(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phonetics: null == phonetics
          ? _value.phonetics
          : phonetics // ignore: cast_nullable_to_non_nullable
              as List<Phonetic>,
      meanings: freezed == meanings
          ? _value.meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MWordCopyWith<$Res> implements $MWordCopyWith<$Res> {
  factory _$$_MWordCopyWith(_$_MWord value, $Res Function(_$_MWord) then) =
      __$$_MWordCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'word') String word,
      @JsonKey(name: 'phonetics') List<Phonetic> phonetics,
      @JsonKey(name: 'meanings') List<Meaning>? meanings});
}

/// @nodoc
class __$$_MWordCopyWithImpl<$Res> extends _$MWordCopyWithImpl<$Res, _$_MWord>
    implements _$$_MWordCopyWith<$Res> {
  __$$_MWordCopyWithImpl(_$_MWord _value, $Res Function(_$_MWord) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? word = null,
    Object? phonetics = null,
    Object? meanings = freezed,
  }) {
    return _then(_$_MWord(
      word: null == word
          ? _value.word
          : word // ignore: cast_nullable_to_non_nullable
              as String,
      phonetics: null == phonetics
          ? _value._phonetics
          : phonetics // ignore: cast_nullable_to_non_nullable
              as List<Phonetic>,
      meanings: freezed == meanings
          ? _value._meanings
          : meanings // ignore: cast_nullable_to_non_nullable
              as List<Meaning>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MWord implements _MWord {
  _$_MWord(
      {@JsonKey(name: 'word') required this.word,
      @JsonKey(name: 'phonetics') required final List<Phonetic> phonetics,
      @JsonKey(name: 'meanings') required final List<Meaning>? meanings})
      : _phonetics = phonetics,
        _meanings = meanings;

  factory _$_MWord.fromJson(Map<String, dynamic> json) =>
      _$$_MWordFromJson(json);

  @override
  @JsonKey(name: 'word')
  final String word;
  final List<Phonetic> _phonetics;
  @override
  @JsonKey(name: 'phonetics')
  List<Phonetic> get phonetics {
    if (_phonetics is EqualUnmodifiableListView) return _phonetics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_phonetics);
  }

  final List<Meaning>? _meanings;
  @override
  @JsonKey(name: 'meanings')
  List<Meaning>? get meanings {
    final value = _meanings;
    if (value == null) return null;
    if (_meanings is EqualUnmodifiableListView) return _meanings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MWord(word: $word, phonetics: $phonetics, meanings: $meanings)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MWord &&
            (identical(other.word, word) || other.word == word) &&
            const DeepCollectionEquality()
                .equals(other._phonetics, _phonetics) &&
            const DeepCollectionEquality().equals(other._meanings, _meanings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      word,
      const DeepCollectionEquality().hash(_phonetics),
      const DeepCollectionEquality().hash(_meanings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MWordCopyWith<_$_MWord> get copyWith =>
      __$$_MWordCopyWithImpl<_$_MWord>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MWordToJson(
      this,
    );
  }
}

abstract class _MWord implements MWord {
  factory _MWord(
          {@JsonKey(name: 'word') required final String word,
          @JsonKey(name: 'phonetics') required final List<Phonetic> phonetics,
          @JsonKey(name: 'meanings') required final List<Meaning>? meanings}) =
      _$_MWord;

  factory _MWord.fromJson(Map<String, dynamic> json) = _$_MWord.fromJson;

  @override
  @JsonKey(name: 'word')
  String get word;
  @override
  @JsonKey(name: 'phonetics')
  List<Phonetic> get phonetics;
  @override
  @JsonKey(name: 'meanings')
  List<Meaning>? get meanings;
  @override
  @JsonKey(ignore: true)
  _$$_MWordCopyWith<_$_MWord> get copyWith =>
      throw _privateConstructorUsedError;
}
