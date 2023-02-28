import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/reorder_paragraph/widgets/reorder_card_widget.dart';
import '../cubit/reorder_pagraph_cubit.dart';
import '../cubit/reorder_pagraph_state.dart';

class OptionReOrderParagraphWidget extends StatelessWidget {
  const OptionReOrderParagraphWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReOrderParagraphCubit, ReOrderParagraphState>(
      builder: (context, state) {
        if (state.options == null) return Container();
        final isAllowDrag = state.isDone == false;
        final options = state.options!;

        return ReorderableListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            buildDefaultDragHandles: isAllowDrag,
            itemBuilder: (context, index) {
              final indexAlphabel = options.indexOf(state.myOption![index]) + 1;
              return ReOrderCardWidget(
                  key: Key(index.toString()),
                  index: indexAlphabel,
                  content: state.myOption!.elementAt(index));
            },
            itemCount: state.options!.length,
            onReorder: (oldIndex, newIndex) => context
                .read<ReOrderParagraphCubit>()
                .changePosition(context, oldIndex, newIndex));
      },
    );
  }
}
