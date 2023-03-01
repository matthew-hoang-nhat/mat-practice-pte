import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/audio/cubit/audio_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/audio/ui/audio_widget.dart';

import '../../cubit/lesson_cubit.dart';
import '../../cubit/lesson_state.dart';
import '../cubit/highlight_summary_cubit.dart';
import '../widgets/option_highlight_summary_widget.dart';
import '../widgets/pre_question_widget.dart';

class HighlighSummaryWidget extends StatelessWidget {
  const HighlighSummaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HighlightSummaryCubit()),
          BlocProvider(create: (context) => AudioCubit()),
        ],
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context.read<HighlightSummaryCubit>().setDone();
                    context.read<AudioCubit>().onDone();
                  } else {
                    context.read<HighlightSummaryCubit>().setRedo();
                    context.read<AudioCubit>().onRedo();
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    final audioUrl = state.currentLesson!.audioUrl!;
                    context
                        .read<HighlightSummaryCubit>()
                        .setDetailLesson(currentLesson);
                    context.read<AudioCubit>().onChangeAudioUrl(audioUrl);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  // RawContentParagraphWidget(),
                  // Divider(color: AppColors.grey),
                  AudioWidget(),
                  PreQuestionWidget(),
                  OptionHighlightSummaryWidget(),
                ])));
  }
}
