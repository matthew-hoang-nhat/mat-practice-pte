import 'package:flutter/material.dart';
import '../../../../widgets/audio/ui/audio_in_lesson_widget.dart';
import '../../../../widgets/exercise/single_choice_answer/ui/single_choice_answer_widget.dart';

class HighlighSummaryWidget extends StatelessWidget {
  const HighlighSummaryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AudioInLessonWidget(),
        SingleChoiceAnswerWidget(),
      ],
    );
  }
}
