import 'package:flutter/material.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/type_component_exercices.dart';

class ReadingFillInBanksWidget extends StatelessWidget {
  const ReadingFillInBanksWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TypeComponentExercises.diveAnswerManyOptions,
      ],
    );
  }
}
