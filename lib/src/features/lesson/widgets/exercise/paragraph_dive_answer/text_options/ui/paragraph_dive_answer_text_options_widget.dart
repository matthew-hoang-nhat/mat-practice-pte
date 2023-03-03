// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/text_options/cubit/paragraph_dive_answer_text_fields_cubit.dart';

import '../../../../../cubit/lesson_cubit.dart';
import '../../../../../cubit/lesson_state.dart';
import '../widgets/paragraph_dive_answer_text_fields_widget.dart';

class ParagraphDiveAnswerTextOptionsWidget extends StatelessWidget {
  const ParagraphDiveAnswerTextOptionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ParagraphDiveAnswerTextFieldsCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context
                        .read<ParagraphDiveAnswerTextFieldsCubit>()
                        .setDone();
                  } else {
                    context
                        .read<ParagraphDiveAnswerTextFieldsCubit>()
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
                        .read<ParagraphDiveAnswerTextFieldsCubit>()
                        .setDetailLesson(currentLesson);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ParagraphDiveAnswerTextFieldWidget(),
                ])));
  }
}
