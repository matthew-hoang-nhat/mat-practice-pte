// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/one_option/cubit/paragraph_dive_answer_one_option_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/one_option/cubit/paragraph_dive_answer_one_option_state.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/exercise/paragraph_dive_answer/one_option/widgets/inkwell_text_table_word_widget.dart';

class TableWordWidget extends StatelessWidget {
  const TableWordWidget({
    Key? key,
    required this.indexWord,
    required this.onClickTableWord,
  }) : super(key: key);
  final int indexWord;
  final Function(int indexWord, int indexOption) onClickTableWord;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ParagraphDiveAnswerOneOptionCubit,
        ParagraphDiveAnswerOneOptionState>(
      buildWhen: (previous, current) =>
          previous.options != current.options ||
          previous.myOption != current.myOption,
      builder: (cubitContext, state) {
        final options = state.options!;
        final myOption = state.myOption;
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Wrap(
              spacing: 10,
              runSpacing: 20,
              children: List.generate(options.length, (index) {
                return InkwellTextTableWordWidget(
                  text: options.elementAt(index),
                  isSelected: myOption.contains(index),
                  onTap: () => onClickTableWord(indexWord, index),
                );
              })),
        );
      },
    );
  }
}
