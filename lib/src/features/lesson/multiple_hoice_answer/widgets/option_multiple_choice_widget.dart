import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/multiple_hoice_answer/cubit/multiple_choice_answer_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/multiple_hoice_answer/cubit/multiple_choice_answer_state.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/inkwell_card_widget.dart';

class OptionMultipleChoiceWidget extends StatelessWidget {
  const OptionMultipleChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultipleChoiceAnswerCubit, MultipleChoiceAnswerState>(
      buildWhen: (previous, current) =>
          previous.options != current.options ||
          previous.isDone != current.isDone ||
          previous.myOption != current.myOption,
      builder: (context, state) {
        if (state.options == null) return Container();
        final options = state.options!;

        return Column(
            children: List<Widget>.generate(options.length, (index) {
          final isAnswer =
              state.answer?.contains(options.elementAt(index)) == true;
          final isSelected = state.myOption.contains(options.elementAt(index));
          return InkWell(
            onTap: () => context
                .read<MultipleChoiceAnswerCubit>()
                .cardOnClick(index, context),
            child: FCardWidget(
              content: options.elementAt(index),
              index: index,
              isAnswer: isAnswer,
              isDone: state.isDone,
              isSelected: isSelected,
            ),
          );
        }).toList());
      },
    );
  }
}
