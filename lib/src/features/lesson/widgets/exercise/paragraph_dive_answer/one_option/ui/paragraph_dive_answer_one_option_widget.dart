// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubit/lesson_cubit.dart';
import '../../../../../cubit/lesson_state.dart';
import '../cubit/paragraph_dive_answer_one_option_cubit.dart';
import '../widgets/paragraph_dive_answer_table_word_widget.dart';

class ParagraphDiveAnswerOneOptionWidget extends StatelessWidget {
  const ParagraphDiveAnswerOneOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ParagraphDiveAnswerOneOptionCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context.read<ParagraphDiveAnswerOneOptionCubit>().setDone();
                  } else {
                    context.read<ParagraphDiveAnswerOneOptionCubit>().setRedo();
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    context
                        .read<ParagraphDiveAnswerOneOptionCubit>()
                        .setDetailLesson(currentLesson);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  ParagraphDiveAnswerTableWordWidget(),
                ])));
  }
}
