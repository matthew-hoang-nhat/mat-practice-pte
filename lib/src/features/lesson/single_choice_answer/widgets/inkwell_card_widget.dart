// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/enum/card_color.dart';
import 'package:mat_practice_pte/src/features/lesson/single_choice_answer/cubit/single_choice_answer_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/single_choice_answer/cubit/single_choice_answer_state.dart';

class InkwellCardWidget extends StatelessWidget {
  const InkwellCardWidget({
    Key? key,
    required this.index,
    required this.content,
  }) : super(key: key);
  final int index;
  final String content;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SingleChoiceAnswerCubit, SingleChoiceAnswerState>(
      builder: (context, state) {
        final String aphabelIndex = String.fromCharCode(65 + index);
        return InkWell(
          onTap: () => state.isDone
              ? null
              : context
                  .read<SingleChoiceAnswerCubit>()
                  .cardOnClick(index, context),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              color: FCardColors.backgroundColor(
                  isDone: state.isDone,
                  isAnswer: state.answer?.contains(content) == true,
                  isSelected:
                      state.myOption == state.options!.elementAt(index)),
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: AppColors.grey),
            ),
            child: Text('$aphabelIndex. $content', style: AppTextStyles.body1),
          ),
        );
      },
    );
  }
}
