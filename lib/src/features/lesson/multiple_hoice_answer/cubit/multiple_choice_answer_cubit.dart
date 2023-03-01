import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_type_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'multiple_choice_answer_state.dart';

class MultipleChoiceAnswerCubit extends Cubit<MultipleChoiceAnswerState>
    implements LessonTypeCubit {
  MultipleChoiceAnswerCubit() : super(MultipleChoiceAnswerState.init());

  @override
  void setDetailLesson(DetailLesson lesson) {
    final question = lesson.questionGroup.questions.first;
    final options = List<String>.from(question.options);
    options.shuffle();
    emit(state.copyWith(
      isDone: false,
      question: question,
      options: options,
      answer: question.answer,
      idLesson: lesson.id,
    ));
  }

  @override
  void setDoScore(context) {
    if (state.myOption.isEmpty) {
      BlocProvider.of<LessonCubit>(context).clearDoScore();
      return;
    }

    final idLesson = state.idLesson!;
    final myOption = state.myOption;

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
      myOption: [],
      options: options,
    ));
  }

  void cardOnClick(int index, BuildContext context) {
    final cardContent = state.options!.elementAt(index);
    if (state.myOption.contains(cardContent) == true) {
      final newMyOpinition = List<String>.from(state.myOption);
      newMyOpinition.removeWhere((item) => item == cardContent);
      emit(state.copyWith(myOption: newMyOpinition));
    } else {
      final newMyOpinition = List<String>.from(state.myOption);
      newMyOpinition.add(cardContent);

      emit(state.copyWith(myOption: newMyOpinition));
    }
    setDoScore(context);
  }
}
