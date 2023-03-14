// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'question_group.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QuestionGroup _$QuestionGroupFromJson(Map<String, dynamic> json) {
  return _QuestionGroup.fromJson(json);
}

/// @nodoc
mixin _$QuestionGroup {
  String? get preQuestion => throw _privateConstructorUsedError;
  List<Question> get questions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QuestionGroupCopyWith<QuestionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionGroupCopyWith<$Res> {
  factory $QuestionGroupCopyWith(
          QuestionGroup value, $Res Function(QuestionGroup) then) =
      _$QuestionGroupCopyWithImpl<$Res, QuestionGroup>;
  @useResult
  $Res call({String? preQuestion, List<Question> questions});
}

/// @nodoc
class _$QuestionGroupCopyWithImpl<$Res, $Val extends QuestionGroup>
    implements $QuestionGroupCopyWith<$Res> {
  _$QuestionGroupCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preQuestion = freezed,
    Object? questions = null,
  }) {
    return _then(_value.copyWith(
      preQuestion: freezed == preQuestion
          ? _value.preQuestion
          : preQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value.questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_QuestionGroupCopyWith<$Res>
    implements $QuestionGroupCopyWith<$Res> {
  factory _$$_QuestionGroupCopyWith(
          _$_QuestionGroup value, $Res Function(_$_QuestionGroup) then) =
      __$$_QuestionGroupCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? preQuestion, List<Question> questions});
}

/// @nodoc
class __$$_QuestionGroupCopyWithImpl<$Res>
    extends _$QuestionGroupCopyWithImpl<$Res, _$_QuestionGroup>
    implements _$$_QuestionGroupCopyWith<$Res> {
  __$$_QuestionGroupCopyWithImpl(
      _$_QuestionGroup _value, $Res Function(_$_QuestionGroup) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? preQuestion = freezed,
    Object? questions = null,
  }) {
    return _then(_$_QuestionGroup(
      preQuestion: freezed == preQuestion
          ? _value.preQuestion
          : preQuestion // ignore: cast_nullable_to_non_nullable
              as String?,
      questions: null == questions
          ? _value._questions
          : questions // ignore: cast_nullable_to_non_nullable
              as List<Question>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QuestionGroup implements _QuestionGroup {
  _$_QuestionGroup({this.preQuestion, required final List<Question> questions})
      : _questions = questions;

  factory _$_QuestionGroup.fromJson(Map<String, dynamic> json) =>
      _$$_QuestionGroupFromJson(json);

  @override
  final String? preQuestion;
  final List<Question> _questions;
  @override
  List<Question> get questions {
    if (_questions is EqualUnmodifiableListView) return _questions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questions);
  }

  @override
  String toString() {
    return 'QuestionGroup(preQuestion: $preQuestion, questions: $questions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionGroup &&
            (identical(other.preQuestion, preQuestion) ||
                other.preQuestion == preQuestion) &&
            const DeepCollectionEquality()
                .equals(other._questions, _questions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, preQuestion,
      const DeepCollectionEquality().hash(_questions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QuestionGroupCopyWith<_$_QuestionGroup> get copyWith =>
      __$$_QuestionGroupCopyWithImpl<_$_QuestionGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QuestionGroupToJson(
      this,
    );
  }
}

abstract class _QuestionGroup implements QuestionGroup {
  factory _QuestionGroup(
      {final String? preQuestion,
      required final List<Question> questions}) = _$_QuestionGroup;

  factory _QuestionGroup.fromJson(Map<String, dynamic> json) =
      _$_QuestionGroup.fromJson;

  @override
  String? get preQuestion;
  @override
  List<Question> get questions;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionGroupCopyWith<_$_QuestionGroup> get copyWith =>
      throw _privateConstructorUsedError;
}
