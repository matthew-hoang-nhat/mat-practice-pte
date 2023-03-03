import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_define_constants.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/exercise_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'paragraph_dive_answer_many_options_state.dart';

class ParagraphDiveAnswerManyOptionsCubit
    extends Cubit<ParagraphDiveAnswerManyOptionsState>
    implements ExerciseCubit {
  ParagraphDiveAnswerManyOptionsCubit()
      : super(ParagraphDiveAnswerManyOptionsState.init());

  @override
  void setDetailLesson(DetailLesson lesson) {
    final questions = lesson.questionGroup.questions;
    final options =
        List<List<String>>.from(questions.map((e) => e.options)).toList();
    emit(state.copyWith(
      isDone: false,
      content: lesson.content,
      questions: questions,
      options: options,
      myOption: List<String?>.filled(questions.length, null),
      answer: questions.map((e) => e.answer.first).toList(),
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

    final List<String> myAnswers =
        myOption.map((e) => e ?? AppDefineConstants.empty).toList();
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
    emit(state.copyWith(
      isDone: false,
      myOption: List.filled(state.options!.length, null),
    ));
  }

  void cardOnClick(BuildContext context, int index, {required String? value}) {
    final newMyOption = List<String?>.from(state.myOption);
    newMyOption[index] = value;
    emit(state.copyWith(myOption: newMyOption));
    setDoScore(context);
  }
}
