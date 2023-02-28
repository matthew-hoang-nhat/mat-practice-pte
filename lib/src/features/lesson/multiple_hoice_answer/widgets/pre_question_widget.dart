import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/word_definition/ui/word_inkwell.dart';

import '../cubit/multiple_choice_answer_cubit.dart';
import '../cubit/multiple_choice_answer_state.dart';

class PreQuestionWidget extends StatelessWidget {
  const PreQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MultipleChoiceAnswerCubit, MultipleChoiceAnswerState>(
      builder: (context, state) {
        if (state.question == null) return Container();
        final questionContent = state.question!.content;
        return RichText(
            text: TextSpan(
                children: questionContent
                    .split(' ')
                    .map((e) => WidgetSpan(
                          child: WordInkwell(
                            textStyle: AppTextStyles.preQuestion,
                            text: e,
                          ),
                        ))
                    .toList()));
      },
    );
  }
}
