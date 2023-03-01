// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/inkwell_card_widget.dart';
import '../cubit/highlight_summary_cubit.dart';
import '../cubit/highlight_summary_state.dart';

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
    return BlocBuilder<HighlightSummaryCubit, HighlightSummaryState>(
      builder: (context, state) {
        return InkWell(
            onTap: () => state.isDone
                ? null
                : context
                    .read<HighlightSummaryCubit>()
                    .cardOnClick(index, context),
            child: FCardWidget(
              content: content,
              index: index,
              isAnswer: state.answer?.contains(content) == true,
              isDone: state.isDone,
              isSelected: state.myOption == state.options!.elementAt(index),
            ));
      },
    );
  }
}
