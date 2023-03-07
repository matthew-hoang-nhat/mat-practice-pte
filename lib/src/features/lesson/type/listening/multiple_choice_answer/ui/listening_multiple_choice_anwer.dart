import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/type_component_exercices.dart';
import '../../../../widgets/audio/ui/audio_in_lesson_widget.dart';

class ListeningMultipleChoiceAnswerWidget extends StatelessWidget {
  const ListeningMultipleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AudioInLessonWidget(),
        TypeComponentExercises.multipleChoiceAnswer,
      ],
    );
  }
}
