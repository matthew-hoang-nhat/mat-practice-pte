import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/highlight_summary/cubit/highlight_summary_cubit.dart';
import 'package:mat_practice_pte/src/features/word_definition/ui/word_inkwell.dart';

import '../cubit/highlight_summary_state.dart';

class PreQuestionWidget extends StatelessWidget {
  const PreQuestionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightSummaryCubit, HighlightSummaryState>(
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
