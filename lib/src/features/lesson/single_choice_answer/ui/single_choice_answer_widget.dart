// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/features/lesson/single_choice_answer/cubit/single_choice_answer_cubit.dart';

import '../widgets/content_paragraph_widget.dart';
import '../widgets/option_single_choice_widget.dart';
import '../widgets/pre_question_widget.dart';

class SingleChoiceAnswerWidget extends StatelessWidget {
  const SingleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SingleChoiceAnswerCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context.read<SingleChoiceAnswerCubit>().setDone();
                  } else {
                    context.read<SingleChoiceAnswerCubit>().setRedo();
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    context
                        .read<SingleChoiceAnswerCubit>()
                        .setDetailLesson(currentLesson);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  RawContentParagraphWidget(),
                  Divider(color: AppColors.grey),
                  PreQuestionWidget(),
                  OptionSingleChoiceWidget(),
                ])));
  }
}
