import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';

import '../../cubit/lesson_cubit.dart';
import '../../cubit/lesson_state.dart';
import '../cubit/multiple_choice_answer_cubit.dart';
import '../../widgets/raw_content_paragraph_widget.dart';
import '../widgets/option_multiple_choice_widget.dart';
import '../widgets/pre_question_widget.dart';

class MultipleChoiceAnswerWidget extends StatelessWidget {
  const MultipleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MultipleChoiceAnswerCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context.read<MultipleChoiceAnswerCubit>().setDone();
                  } else {
                    context.read<MultipleChoiceAnswerCubit>().setRedo();
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    context
                        .read<MultipleChoiceAnswerCubit>()
                        .setDetailLesson(currentLesson);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  RawContentParagraphWidget(),
                  Divider(color: AppColors.grey),
                  PreQuestionWidget(),
                  OptionMultipleChoiceWidget(),
                ])));
  }
}
