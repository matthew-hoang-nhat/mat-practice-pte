import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/utils/helpers/word_extentions.dart';

import '../cubit/paragraph_dive_answer_one_option_cubit.dart';
import '../../../../answer_incorrect_word_widget.dart';
import '../cubit/paragraph_dive_answer_one_option_state.dart';
import 'inkwell_text_dive_answer_widget.dart';

class ParagraphDiveAnswerTableWordWidget extends StatelessWidget {
  const ParagraphDiveAnswerTableWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParagraphDiveAnswerOneOptionCubit,
        ParagraphDiveAnswerOneOptionState>(
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.options != current.options ||
          previous.questions != current.questions ||
          previous.myOption != current.myOption ||
          previous.isDone != current.isDone,
      builder: (context, state) {
        if (state.content == null) return Container();

        return WordExtension.parseToInkwellParagraphDiveAnswer(
            state.content!,
            List.generate(state.questions!.length, (index) {
              final value = state.myOption[index] == null
                  ? ''
                  : state.options![state.myOption[index]!];
              return TextSpan(children: [
                WidgetSpan(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child: InkwellDiveWordWidget(
                      indexDiveWord: index,
                      text: value,
                      isDone: state.isDone,
                      isAnswer: value == state.answer?.elementAt(index),
                    ),
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
