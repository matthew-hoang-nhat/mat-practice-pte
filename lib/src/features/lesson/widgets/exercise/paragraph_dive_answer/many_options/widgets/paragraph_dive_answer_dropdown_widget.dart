import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/highlight_incorrect_word/widgets/answer_incorrect_word_widget.dart';
import 'package:mat_practice_pte/src/utils/helpers/word_extentions.dart';

import '../cubit/paragraph_dive_answer_many_options_cubit.dart';
import '../cubit/paragraph_dive_answer_many_options_state.dart';
import 'dropdown_dive_answer_widget.dart';

class ParagraphDiveAnswerDropDownWidget extends StatelessWidget {
  const ParagraphDiveAnswerDropDownWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParagraphDiveAnswerManyOptionsCubit,
        ParagraphDiveAnswerManyOptionsState>(
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.options != current.options ||
          previous.questions != current.questions ||
          previous.myOption != current.myOption ||
          previous.isDone != current.isDone,
      builder: (context, state) {
        if (state.content == null) return Container();
        final options = state.options!;
        final content = state.content!;

        return WordExtension.parseToInkwellParagraphDiveAnswer(
            content,
            List<TextSpan>.generate(options.length, (index) {
              final myOption = state.myOption;
              final answers = state.answer!;
              return TextSpan(children: [
                WidgetSpan(
                  child: DropDownDiveAnswerWidget(
                    items: options.elementAt(index),
                    value: state.myOption.elementAt(index),
                    onChanged: (value) => context
                        .read<ParagraphDiveAnswerManyOptionsCubit>()
                        .cardOnClick(context, index, value: value),
                    isDone: state.isDone,
                    isAnswer:
                        myOption.elementAt(index) == answers.elementAt(index),
                  ),
                ),
                if (state.isDone)
                  WidgetSpan(
                      child: AnswerIncorrectWordWidget(
                    answer: state.answer!.elementAt(index),
                  ))
              ]);
            }));
      },
    );
  }
}
