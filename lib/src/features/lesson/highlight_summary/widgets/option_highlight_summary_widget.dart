import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/highlight_summary_cubit.dart';
import '../cubit/highlight_summary_state.dart';
import 'inkwell_card_widget.dart';

class OptionHighlightSummaryWidget extends StatelessWidget {
  const OptionHighlightSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HighlightSummaryCubit, HighlightSummaryState>(
      builder: (context, state) {
        if (state.options == null) return Container();
        final options = state.options!;
        return Column(
            children: List<Widget>.generate(
                options.length,
                (index) => InkwellCardWidget(
                    index: index, content: options.elementAt(index))).toList());
      },
    );
  }
}
