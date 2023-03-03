import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/highlight_incorrect_word/widgets/answer_incorrect_word_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/highlight_incorrect_word/widgets/inkwel_incorrect_word_widget.dart';

import '../cubit/highlight_incorrect_word_cubit.dart';
import '../cubit/highlight_incorrect_word_state.dart';

class InkwellParagraphHighlightIncorrectWordWidget extends StatelessWidget {
  const InkwellParagraphHighlightIncorrectWordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightIncorrectWordCubit,
        HighlightIncorrectWordState>(
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.options != current.options ||
          previous.isDone != current.isDone ||
          previous.myOption != current.myOption,
      builder: (context, state) {
        if (state.options == null) return Container();

        final content = state.content!;

        return RichText(
            text: TextSpan(
                children: List.generate(content.length, (index) {
          final isAnswer = state.indexAnswers.contains(index);

          return TextSpan(children: [
            WidgetSpan(
              child: InkwellHighlightWordWidget(
                text: content.elementAt(index),
                isAnswer: isAnswer,
                onTap: () => state.isDone
                    ? FCoordinator.showDefinition(content.elementAt(index))
                    : context
                        .read<HighlightIncorrectWordCubit>()
                        .cardOnClick(context, index),
                isDone: state.isDone,
                isSelected: state.myOption.elementAt(index),
              ),
            ),
            if (isAnswer && state.isDone)
              WidgetSpan(
                  child: AnswerIncorrectWordWidget(
                      answer: state.answer!
                          .elementAt(state.indexAnswers.indexOf(index)))),
          ]);
        })));
      },
    );
  }
}
