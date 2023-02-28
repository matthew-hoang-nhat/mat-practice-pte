import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_type_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'reorder_pagraph_state.dart';

class ReOrderParagraphCubit extends Cubit<ReOrderParagraphState>
    implements LessonTypeCubit {
  ReOrderParagraphCubit() : super(ReOrderParagraphState.init());

  @override
  void setDetailLesson(DetailLesson lesson) {
    final question = lesson.questionGroup.questions.first;
    final options = List<String>.from(question.options);
    options.shuffle();
    emit(state.copyWith(
      isDone: false,
      question: question,
      options: options,
      myOption: options,
      answer: question.answer,
      idLesson: lesson.id,
    ));
  }

  void changePosition(context, int oldIndex, int newIndex) {
    final newMyOption = List<String>.from(state.myOption!);
    var itemChanged = newMyOption.elementAt(oldIndex);

    newMyOption.removeAt(oldIndex);
    if (newIndex == 0) {
      newMyOption.insert(0, itemChanged);
    } else {
      final newDestination = newIndex > oldIndex ? newIndex - 1 : newIndex;
      newMyOption.insert(newDestination, itemChanged);
    }

    emit(state.copyWith(myOption: newMyOption));

    setDoScore(context);
  }

  @override
  void setDoScore(context) {
    if (state.myOption == null) {
      BlocProvider.of<LessonCubit>(context).clearDoScore();
      return;
    }

    final idLesson = state.idLesson!;
    final myOption = state.myOption!;

    final List<String> myAnswers = myOption;
    BlocProvider.of<LessonCubit>(context).setDoScore(DoScore(
      idLesson: idLesson,
      answers: myAnswers,
    ));
  }

  @override
  void setDone() {
    emit(state.copyWith(isDone: true));
  }

  @override
  void setRedo() {
    final options = List<String>.from(state.options!);
    options.shuffle();
    emit(state.copyWith(
      isDone: false,
      myOption: options,
      options: options,
    ));
  }
}
