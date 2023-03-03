// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mat_practice_pte/src/networks/models/lesson/question.dart';

class ParagraphDiveAnswerTextFieldsState extends Equatable {
  const ParagraphDiveAnswerTextFieldsState({
    this.questions,
    this.answer,
    this.content,
    required this.myOption,
    this.idLesson,
    required this.isDone,
  });
  final List<Question>? questions;
  final List<String>? answer;
  final String? content;
  final List<String?> myOption;
  final String? idLesson;
  final bool isDone;

  factory ParagraphDiveAnswerTextFieldsState.init() =>
      const ParagraphDiveAnswerTextFieldsState(
        answer: [],
        myOption: [],
        isDone: false,
      );
  @override
  List<Object?> get props =>
      [questions, answer, myOption, isDone, idLesson, content];

  ParagraphDiveAnswerTextFieldsState copyWith({
    List<Question>? questions,
    List<String>? answer,
    String? content,
    List<String?>? myOption,
    String? idLesson,
    bool? isDone,
  }) {
    return ParagraphDiveAnswerTextFieldsState(
      questions: questions ?? this.questions,
      answer: answer ?? this.answer,
      content: content ?? this.content,
      myOption: myOption ?? this.myOption,
      idLesson: idLesson ?? this.idLesson,
      isDone: isDone ?? this.isDone,
    );
  }
}
