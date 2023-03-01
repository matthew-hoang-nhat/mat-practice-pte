// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../cubit/lesson_cubit.dart';
import '../../../../cubit/lesson_state.dart';
import '../cubit/reorder_pagraph_cubit.dart';
import '../widgets/option_reorder_paragraph_widget.dart';

class ReOrderParagraphWidget extends StatelessWidget {
  const ReOrderParagraphWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => ReOrderParagraphCubit(),
        child: MultiBlocListener(
            listeners: [
              BlocListener<LessonCubit, LessonState>(
                listenWhen: (previous, current) =>
                    previous.isDone != current.isDone,
                listener: (context, state) {
                  if (state.isDone) {
                    context.read<ReOrderParagraphCubit>().setDone();
                  } else {
                    context.read<ReOrderParagraphCubit>()
                      ..setRedo()
                      ..setDoScore(context);
                  }
                },
              ),
              BlocListener<LessonCubit, LessonState>(
                  listenWhen: (previous, current) =>
                      previous.currentLesson?.id != current.currentLesson?.id,
                  listener: (context, state) {
                    final currentLesson = state.currentLesson!;
                    context.read<ReOrderParagraphCubit>()
                      ..setDetailLesson(currentLesson)
                      ..setDoScore(context);
                  }),
            ],
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  OptionReOrderParagraphWidget(),
                ])));
  }
}
