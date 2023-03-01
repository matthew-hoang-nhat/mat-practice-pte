// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mat_practice_pte/src/networks/models/lesson/question.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';

class SingleChoiceAnswerState extends Equatable {
  const SingleChoiceAnswerState({
    required this.question,
    required this.answer,
    required this.options,
    required this.myOption,
    required this.idLesson,
    required this.isDone,
  });
  final Question? question;
  final List<String>? answer;
  final List<String>? options;
  final String? myOption;

  final String? idLesson;
  final bool isDone;

  factory SingleChoiceAnswerState.init() => const SingleChoiceAnswerState(
      idLesson: null,
      answer: null,
      question: null,
      myOption: null,
      isDone: false,
      options: null);
  @override
  List<Object?> get props =>
      [question, answer, myOption, options, isDone, idLesson];

  SingleChoiceAnswerState copyWith({
    Question? question,
    List<String>? answer,
    List<String>? options,
    List<bool>? stateMeCards,
    Wrapper<String>? myOption,
    bool? isDone,
    String? idLesson,
  }) {
    return SingleChoiceAnswerState(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      options: options ?? this.options,
      isDone: isDone ?? this.isDone,
      myOption: myOption == null ? this.myOption : myOption.value,
      idLesson: idLesson ?? this.idLesson,
    );
  }
}
