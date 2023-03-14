import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/multiple_hoice_answer/cubit/multiple_choice_answer_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/multiple_hoice_answer/cubit/multiple_choice_answer_state.dart';

import 'inkwell_card_widget.dart';

class OptionMultipleChoiceWidget extends StatelessWidget {
  const OptionMultipleChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultipleChoiceAnswerCubit, MultipleChoiceAnswerState>(
      builder: (context, state) {
        if (state.options == null) return Container();
        final options = state.options!;
        return Column(
            children: List<Widget>.generate(
                options.length,
                (index) => InkwellCardWidget(
                    index: index, content: options.elementAt(index))).toList());
      },
    );
  }
}
