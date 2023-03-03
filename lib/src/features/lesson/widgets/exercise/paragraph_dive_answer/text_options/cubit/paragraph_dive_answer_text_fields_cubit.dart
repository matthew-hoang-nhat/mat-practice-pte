import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_define_constants.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/exercise_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'paragraph_dive_answer_text_fields_state.dart';

class ParagraphDiveAnswerTextFieldsCubit
    extends Cubit<ParagraphDiveAnswerTextFieldsState> implements ExerciseCubit {
  ParagraphDiveAnswerTextFieldsCubit()
      : super(ParagraphDiveAnswerTextFieldsState.init());

  final textEditingControllers = <TextEditingController>[];

  void clearTextEdittingControler() {
    for (var item in textEditingControllers) {
      item.dispose();
    }
    textEditingControllers.clear();
  }

  void refreshTextEdittingController() {
    for (var item in textEditingControllers) {
      item.clear();
    }
  }

  void addTextEdittingController() {
    final lenController = state.questions!.length;
    textEditingControllers.addAll(
        List.generate(lenController, (index) => TextEditingController()));
  }

  @override
  void setDetailLesson(DetailLesson lesson) {
    final questions = lesson.questionGroup.questions;

    emit(state.copyWith(
      isDone: false,
      content: lesson.content,
      questions: questions,
      myOption: List<String?>.filled(questions.length, null),
      answer: questions.map((e) => e.answer.first).toList(),
      idLesson: lesson.id,
    ));
    addTextEdittingController();
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
      myOption: List.filled(state.questions!.length, null),
    ));
    refreshTextEdittingController();
  }

  void onChanged(BuildContext context, int index, {required String? value}) {
    final newMyOption = List<String?>.from(state.myOption);
    newMyOption[index] = value;
    emit(state.copyWith(myOption: newMyOption));
    setDoScore(context);
  }
}
