import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../inkwell_card_widget.dart';
import '../cubit/single_choice_answer_cubit.dart';
import '../cubit/single_choice_answer_state.dart';

class OptionSingleChoiceWidget extends StatelessWidget {
  const OptionSingleChoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleChoiceAnswerCubit, SingleChoiceAnswerState>(
      builder: (context, state) {
        if (state.options == null) return Container();
        final options = state.options!;
        return Column(
            children: List<Widget>.generate(options.length, (index) {
          final isAnswer =
              state.answer?.contains(options.elementAt(index)) == true;
          final isSelected = state.myOption == options.elementAt(index);
          return InkWell(
            onTap: () => context
                .read<SingleChoiceAnswerCubit>()
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
