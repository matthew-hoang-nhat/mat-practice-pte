// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:mat_practice_pte/src/networks/models/lesson/question.dart';

class HighlightIncorrectWordState extends Equatable {
  const HighlightIncorrectWordState({
    required this.question,
    required this.answer,
    required this.options,
    required this.myOption,
    required this.indexAnswers,
    required this.idLesson,
    required this.isDone,
    required this.content,
  });
  final Question? question;
  final List<String>? answer;
  final List<String>? options;
  final List<bool> myOption;
  final List<int> indexAnswers;
  final List<String>? content;
  final String? idLesson;
  final bool isDone;

  factory HighlightIncorrectWordState.init() =>
      const HighlightIncorrectWordState(
          idLesson: null,
          answer: [],
          indexAnswers: [],
          question: null,
          content: null,
          myOption: [],
          isDone: false,
          options: null);
  @override
  List<Object?> get props => [
        question,
        answer,
        myOption,
        options,
        isDone,
        idLesson,
        content,
        indexAnswers
      ];

  HighlightIncorrectWordState copyWith({
    Question? question,
    List<String>? answer,
    List<String>? options,
    List<bool>? myOption,
    List<int>? indexAnswers,
    List<String>? content,
    String? idLesson,
    bool? isDone,
  }) {
    return HighlightIncorrectWordState(
      question: question ?? this.question,
      answer: answer ?? this.answer,
      options: options ?? this.options,
      myOption: myOption ?? this.myOption,
      indexAnswers: indexAnswers ?? this.indexAnswers,
      content: content ?? this.content,
      idLesson: idLesson ?? this.idLesson,
      isDone: isDone ?? this.isDone,
    );
  }
}
