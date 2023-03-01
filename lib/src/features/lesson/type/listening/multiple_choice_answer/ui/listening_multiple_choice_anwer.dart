import 'package:flutter/material.dart';
import '../../../../widgets/audio/ui/audio_in_lesson_widget.dart';
import '../../../../widgets/exercise/multiple_choice_answer/ui/multiple_choice_answer_widget.dart';

class ListeningMultipleChoiceAnswerWidget extends StatelessWidget {
  const ListeningMultipleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AudioInLessonWidget(),
        MultipleChoiceAnswerWidget(),
      ],
    );
  }
}
