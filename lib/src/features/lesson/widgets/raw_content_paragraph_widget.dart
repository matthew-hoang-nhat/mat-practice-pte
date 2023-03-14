import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_state.dart';
import 'package:mat_practice_pte/src/utils/helpers/word_extentions.dart';

class RawContentParagraphWidget extends StatelessWidget {
  const RawContentParagraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonCubit, LessonState>(
      buildWhen: (previous, current) =>
          previous.currentLesson != current.currentLesson,
      builder: (context, state) {
        return WordExtension.parseToInkwellParagraph(
            state.currentLesson?.content ?? '');
      },
    );
  }
}
