import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/exercise_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import '../../../../cubit/lesson_cubit.dart';
import 'highlight_incorrect_word_state.dart';

class HighlightIncorrectWordCubit extends Cubit<HighlightIncorrectWordState>
    implements ExerciseCubit {
  HighlightIncorrectWordCubit() : super(HighlightIncorrectWordState.init());

  void _seperateParagraphToContentAndIndexAnswers(
      {required String paragraph,
      required List<String> options,
      required List<String> answer}) {
    final content = paragraph.split(' ');
    final RegExp answerRegExp = RegExp('#[0-9]#,*;*.*');
    final indexAnswers = <int>[];
    for (int index = 0; index < content.length; index++) {
      final isAnswer = content.elementAt(index).contains(answerRegExp);
      if (isAnswer) {
        final code = int.parse(content.elementAt(index).replaceAll('#', ''));
        content[index] = options.elementAt(code);
        indexAnswers.add(index);
      }
    }
    emit(state.copyWith(
      content: content,
      indexAnswers: indexAnswers,
    ));
  }

  @override
  void setDetailLesson(DetailLesson lesson) {
    final question = lesson.questionGroup.questions.first;
    final options = lesson.questionGroup.questions.first.options;
    final answer = question.answer;

    emit(state.copyWith(
      question: question,
      isDone: false,
      options: options,
      answer: answer,
      idLesson: lesson.id,
    ));

    _seperateParagraphToContentAndIndexAnswers(
      paragraph: question.content,
      answer: answer,
      options: options,
    );

    emit(state.copyWith(
        myOption: List.generate(state.content!.length, (index) => false)));
  }

  static const _empty = '#';
  static const _wrong = 'x';

  @override
  void setDoScore(context) {
    if (state.myOption.isEmpty) {
      BlocProvider.of<LessonCubit>(context).clearDoScore();
      return;
    }
    final myOption = state.myOption;
    final content = state.content!;

    List<String> userChoices = [];
    for (int index in state.indexAnswers) {
      String value =
          myOption.elementAt(index) ? content.elementAt(index) : _empty;
      userChoices.add(value);
    }

    int countSelected = state.myOption.where((element) => element).length;
    int countTrueSelected =
        userChoices.where((element) => element != _empty).length;

    final int countWrongAnswers = max(0, countSelected - countTrueSelected);
    userChoices.addAll(List<String>.filled(countWrongAnswers, _wrong));

    BlocProvider.of<LessonCubit>(context)
        .setDoScore(DoScore(idLesson: state.idLesson!, answers: userChoices));
  }

  @override
  void setDone() {
    // final maxScore = state.answer!.length;
    // double score = 0;

    // for (var index in state.indexAnswers) {
    //   if (state.myOption.elementAt(index)) {
    //     score++;
    //   }
    // }

    // final numberFalseChoice =
    //     state.myOption.where((element) => element).length - score;
    // score = score - numberFalseChoice;

    emit(state.copyWith(isDone: true));
  }

  @override
  void setRedo() {
    emit(state.copyWith(
      isDone: false,
      myOption: List.generate(state.content!.length, (index) => false),
    ));
  }

  void cardOnClick(BuildContext context, int index) {
    final newMyOption = List<bool>.from(state.myOption);
    newMyOption[index] = !newMyOption[index];
    emit(state.copyWith(myOption: newMyOption));
    setDoScore(context);
  }
}
