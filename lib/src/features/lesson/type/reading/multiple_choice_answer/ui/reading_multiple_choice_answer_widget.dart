import 'package:flutter/material.dart';

import '../../../../widgets/exercise/multiple_choice_answer/ui/multiple_choice_answer_widget.dart';

class ReadingMultipleChoiceAnswerWidget extends StatelessWidget {
  const ReadingMultipleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MultipleChoiceAnswerWidget(),
      ],
    );
  }
}
