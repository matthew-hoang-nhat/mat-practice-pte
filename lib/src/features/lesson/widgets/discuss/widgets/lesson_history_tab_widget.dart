// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/widgets/lesson_history_widget.dart';

import '../../../cubit/lesson_state.dart';
import '../cubit/history_cubit.dart';

class LessonHistoryTabWidget extends StatelessWidget {
  const LessonHistoryTabWidget({Key? key, required this.controller})
      : super(key: key);
  final RefreshController controller;
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LessonCubit, LessonState>(
          listenWhen: (previous, current) => previous.isDone != current.isDone,
          listener: (context, state) {
            if (state.isDone) {
              context.read<HistoryCubit>().refreshLessonHistories();
            }
          },
        ),
      ],
      child: BlocBuilder<HistoryCubit, HistoryState>(
        buildWhen: (previous, current) =>
            previous.lessonHistories != current.lessonHistories,
        builder: (context, state) {
          return Column(
              children: state.lessonHistories
                  .map((e) => LessonHistoryWidget(history: e))
                  .toList());
        },
      ),
    );
  }
}
