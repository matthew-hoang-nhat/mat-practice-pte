import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/exercise_cubit.dart';
import 'package:mat_practice_pte/src/networks/models/do_score/do_score.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';
import 'single_choice_answer_state.dart';

class SingleChoiceAnswerCubit extends Cubit<SingleChoiceAnswerState>
    implements ExerciseCubit {
  SingleChoiceAnswerCubit() : super(SingleChoiceAnswerState.init());

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
    if (state.myOption == null) {
      BlocProvider.of<LessonCubit>(context).clearDoScore();
      return;
    }

    final idLesson = state.idLesson!;
    final myOption = state.myOption!;

    final List<String> myAnswers = [myOption];
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
      myOption: Wrapper(null),
      options: options,
    ));
  }

  void cardOnClick(index, context) {
    final cardContent = state.options?.elementAt(index);
    if (state.myOption == cardContent) {
      emit(state.copyWith(myOption: Wrapper(null)));
    } else {
      emit(state.copyWith(myOption: Wrapper(state.options?.elementAt(index))));
    }
    setDoScore(context);
  }
}
