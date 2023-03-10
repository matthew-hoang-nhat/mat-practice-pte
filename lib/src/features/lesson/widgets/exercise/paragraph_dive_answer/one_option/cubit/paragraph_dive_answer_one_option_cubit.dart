import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_define_constants.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/exercise_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import '../../../../../cubit/lesson_cubit.dart';
import 'paragraph_dive_answer_one_option_state.dart';

class ParagraphDiveAnswerOneOptionCubit
    extends Cubit<ParagraphDiveAnswerOneOptionState> implements ExerciseCubit {
  ParagraphDiveAnswerOneOptionCubit()
      : super(ParagraphDiveAnswerOneOptionState.init());

  @override
  void setDetailLesson(DetailLesson lesson) {
    final questions = lesson.questionGroup.questions;
    final options = List<String>.from(
        questions.map((e) => e.options).toList().expand((element) => element));

    options.shuffle();

    emit(state.copyWith(
      isDone: false,
      content: lesson.content,
      questions: questions,
      options: options,
      myOption: List<int?>.filled(questions.length, null),
      answer: questions.map((e) => e.answer.first).toList(),
      idLesson: lesson.id,
    ));
  }

  @override
  void setDoScore(lessonContext) {
    if (state.myOption.isEmpty) {
      BlocProvider.of<LessonCubit>(lessonContext).clearDoScore();
      return;
    }

    final idLesson = state.idLesson!;
    final myOption = state.myOption;
    final options = state.options!;

    final List<String> myAnswers = myOption
        .map((e) => e != null ? options[e] : AppDefineConstants.empty)
        .toList();
    BlocProvider.of<LessonCubit>(lessonContext).setDoScore(DoScore(
      idLesson: idLesson,
      answers: myAnswers,
    ));
  }

  @override
  void setDone() {
    emit(state.copyWith(isDone: true));
  }

  void shuffleOptions() {
    final options = List<String>.from(state.options!);
    options.shuffle();
    emit(state.copyWith(options: options));
  }

  @override
  void setRedo() {
    shuffleOptions();
    emit(state.copyWith(
      isDone: false,
      myOption: List.filled(state.answer!.length, null),
    ));
  }

  void showTableWord(int index, {required Widget dialog}) {
    FCoordinator.showBottomModalSheet(
        title: Row(
          children: [
            Text(
              'Click to choose',
              style: AppTextStyles.mediumTitleDialog,
            ),
          ],
        ),
        widget: dialog);
  }

  void wordTableOnClick(BuildContext lessonContext, int index,
      {required int indexOption}) {
    final newMyOption = List<int?>.from(state.myOption);
    if (newMyOption.contains(indexOption) == false) {
      newMyOption[index] = indexOption;
      emit(state.copyWith(myOption: newMyOption));
    }
    setDoScore(lessonContext);
  }
}
