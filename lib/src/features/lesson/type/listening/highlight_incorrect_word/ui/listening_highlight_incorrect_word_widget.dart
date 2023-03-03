import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/audio/ui/audio_in_lesson_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/highlight_incorrect_word/ui/highlight_incorrect_word_widget.dart';

class ListeningHighlightIncorrectWordWidget extends StatelessWidget {
  const ListeningHighlightIncorrectWordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AudioInLessonWidget(),
        HighlightIncorrectWordWidget(),
      ],
    );
  }
}
