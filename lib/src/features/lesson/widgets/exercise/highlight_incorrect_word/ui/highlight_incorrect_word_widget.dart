import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/lesson_cubit.dart';
import '../../../../cubit/lesson_state.dart';
import '../cubit/highlight_incorrect_word_cubit.dart';
import '../widgets/inkwell_paragraph_incorrect_word_widget.dart';

class HighlightIncorrectWordWidget extends StatelessWidget {
  const HighlightIncorrectWordWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HighlightIncorrectWordCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context.read<HighlightIncorrectWordCubit>().setDone();
                  } else {
                    context.read<HighlightIncorrectWordCubit>().setRedo();
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    context
                        .read<HighlightIncorrectWordCubit>()
                        .setDetailLesson(currentLesson);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  InkwellParagraphHighlightIncorrectWordWidget(),
                ])));
  }
}
