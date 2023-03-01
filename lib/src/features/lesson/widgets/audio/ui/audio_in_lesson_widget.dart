import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/lesson_cubit.dart';
import '../../../cubit/lesson_state.dart';
import '../cubit/audio_cubit.dart';
import 'audio_widget.dart';

class AudioInLessonWidget extends StatelessWidget {
  const AudioInLessonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AudioCubit(),
        child: MultiBlocListener(
          listeners: [
            BlocListener<LessonCubit, LessonState>(
              listenWhen: (previous, current) =>
                  previous.isDone != current.isDone,
              listener: (context, state) {
                if (state.isDone) {
                  context.read<AudioCubit>().onDone();
                } else {
                  context.read<AudioCubit>().onRedo();
                }
              },
            ),
            BlocListener<LessonCubit, LessonState>(
              listenWhen: (previous, current) =>
                  previous.currentLesson?.id != current.currentLesson?.id,
              listener: (context, state) {
                final audioUrl = state.currentLesson!.audioUrl!;
                context.read<AudioCubit>().onChangeAudioUrl(audioUrl);
              },
            ),
          ],
          child: const AudioWidget(),
        ));
  }
}
