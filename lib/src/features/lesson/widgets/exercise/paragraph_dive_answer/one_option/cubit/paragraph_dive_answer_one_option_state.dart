// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mat_practice_pte/src/networks/models/lesson/question.dart';

class ParagraphDiveAnswerOneOptionState extends Equatable {
  const ParagraphDiveAnswerOneOptionState({
    this.questions,
    this.answer,
    this.content,
    this.options,
    required this.myOption,
    this.idLesson,
    required this.isDone,
  });
  final List<Question>? questions;
  final List<String>? answer;
  final String? content;
  final List<String>? options;
  final List<int?> myOption;
  final String? idLesson;
  final bool isDone;

  factory ParagraphDiveAnswerOneOptionState.init() =>
      const ParagraphDiveAnswerOneOptionState(
        answer: [],
        myOption: [],
        isDone: false,
      );
  @override
  List<Object?> get props =>
      [questions, answer, myOption, options, isDone, idLesson, content];

  ParagraphDiveAnswerOneOptionState copyWith({
    List<Question>? questions,
    List<String>? answer,
    String? content,
    List<String>? options,
    List<int?>? myOption,
    String? idLesson,
    bool? isDone,
  }) {
    return ParagraphDiveAnswerOneOptionState(
      questions: questions ?? this.questions,
      answer: answer ?? this.answer,
      content: content ?? this.content,
      options: options ?? this.options,
      myOption: myOption ?? this.myOption,
      idLesson: idLesson ?? this.idLesson,
      isDone: isDone ?? this.isDone,
    );
  }
}
