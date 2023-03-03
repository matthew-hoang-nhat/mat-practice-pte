import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_status_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/one_option/widgets/table_word_widget.dart';

import '../cubit/paragraph_dive_answer_one_option_cubit.dart';

class InkwellDiveWordWidget extends StatelessWidget {
  const InkwellDiveWordWidget(
      {super.key,
      required this.indexDiveWord,
      required this.text,
      required this.isDone,
      required this.isAnswer});
  final int indexDiveWord;
  final String text;
  final bool isDone;
  final bool isAnswer;

  @override
  Widget build(BuildContext context) {
    final isEmpty = text.isEmpty;
    final foregroundColor =
        AppStatusColors.toColor(isAnswer: isAnswer, isDone: isDone);
    return Wrap(
      children: [
        InkWell(
          onTap: () => isDone
              ? null
              : context.read<ParagraphDiveAnswerOneOptionCubit>().showTableWord(
                    indexDiveWord,
                    dialog: BlocProvider.value(
                        value:
                            context.read<ParagraphDiveAnswerOneOptionCubit>(),
                        child: TableWordWidget(
                            indexWord: indexDiveWord,
                            onClickTableWord:
                                (int indexTableWord, int indexOption) => context
                                    .read<ParagraphDiveAnswerOneOptionCubit>()
                                    .wordTableOnClick(context, indexTableWord,
                                        indexOption: indexOption))),
                  ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            decoration: BoxDecoration(
                border: Border.all(
              color: isEmpty ? AppColors.grey : foregroundColor,
            )),
            constraints: const BoxConstraints(minWidth: 80),
            child: Wrap(
              children: [
                Container(
                  constraints: const BoxConstraints(minWidth: 80),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body1
                        .copyWith(fontSize: 18, color: foregroundColor),
                  ),
                ),
                Icon(
                  AppIcons.iconDown,
                  color: foregroundColor,
                ),
              ],
            ),
          ),
        ),
        if (isDone)
          Icon(
            isAnswer ? AppIcons.iconCheck : AppIcons.iconUncheck,
            color: foregroundColor,
          ),
      ],
    );
  }
}
