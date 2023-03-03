import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/highlight_incorrect_word/widgets/answer_incorrect_word_widget.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/text_options/cubit/paragraph_dive_answer_text_fields_state.dart';
import 'package:mat_practice_pte/src/utils/helpers/word_extentions.dart';
import '../cubit/paragraph_dive_answer_text_fields_cubit.dart';
import 'text_field_dive_answer_widget.dart';

class ParagraphDiveAnswerTextFieldWidget extends StatelessWidget {
  const ParagraphDiveAnswerTextFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParagraphDiveAnswerTextFieldsCubit,
        ParagraphDiveAnswerTextFieldsState>(
      buildWhen: (previous, current) =>
          previous.content != current.content ||
          previous.questions != current.questions ||
          previous.myOption != current.myOption ||
          previous.isDone != current.isDone,
      builder: (context, state) {
        if (state.content == null) return Container();
        final questions = state.questions!;
        final content = state.content!;

        return WordExtension.parseToInkwellParagraphDiveAnswer(
            content,
            List<TextSpan>.generate(questions.length, (index) {
              final myOption = state.myOption;
              final answers = state.answer!;
              final isAnswer =
                  myOption.elementAt(index) == answers.elementAt(index);

              return TextSpan(children: [
                WidgetSpan(
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 3, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100)),
                      child: TextFieldDiveAnswerWidget(
                        onChanged: (value) => context
                            .read<ParagraphDiveAnswerTextFieldsCubit>()
                            .onChanged(context, index, value: value),
                        isDone: state.isDone,
                        isAnswer: isAnswer,
                        textEditingController: context
                            .read<ParagraphDiveAnswerTextFieldsCubit>()
                            .textEditingControllers[index],
                      )),
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
