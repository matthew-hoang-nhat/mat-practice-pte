import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/audio/ui/audio_in_lesson_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/type_component_exercices.dart';

class ListeningSingleChoiceAnswerWidget extends StatelessWidget {
  const ListeningSingleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        AudioInLessonWidget(),
        TypeComponentExercises.singleChoiceAnswer
      ],
    );
  }
}
