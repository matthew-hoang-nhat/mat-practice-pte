// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/many_options/cubit/paragraph_dive_answer_many_options_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/many_options/widgets/paragraph_dive_answer_dropdown_widget.dart';

import '../../../../../cubit/lesson_cubit.dart';
import '../../../../../cubit/lesson_state.dart';

class ParagraphDiveAnswerManyOptionsWidget extends StatelessWidget {
  const ParagraphDiveAnswerManyOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ParagraphDiveAnswerManyOptionsCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context
                        .read<ParagraphDiveAnswerManyOptionsCubit>()
                        .setDone();
                  } else {
                    context
                        .read<ParagraphDiveAnswerManyOptionsCubit>()
                        .setRedo();
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    context
                        .read<ParagraphDiveAnswerManyOptionsCubit>()
                        .setDetailLesson(currentLesson);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ParagraphDiveAnswerDropDownWidget(),
                ])));
  }
}
