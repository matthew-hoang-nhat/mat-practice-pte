import 'package:flutter/material.dart';

import '../../../../widgets/exercise/single_choice_answer/ui/single_choice_answer_widget.dart';

class ReadingSingleChoiceAnswerWidget extends StatelessWidget {
  const ReadingSingleChoiceAnswerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SingleChoiceAnswerWidget(),
      ],
    );
  }
}
