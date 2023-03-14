// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/comment_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/widgets/tab_bar_discuss.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/features/lesson/cubit/lesson_cubit.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/discuss_cubit.dart';

import '../../../cubit/lesson_state.dart';
import '../cubit/history_cubit.dart';
import '../widgets/comment_tab_widget.dart';
import '../widgets/lesson_history_tab_widget.dart';

class DiscussComponentWidget extends StatelessWidget {
  const DiscussComponentWidget({Key? key, required this.controller})
      : super(key: key);
  final RefreshController controller;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LessonCubit, LessonState>(
            listenWhen: (previous, current) =>
                previous.isDone != current.isDone,
            listener: (context, state) {
              if (state.isDone) {
                const historyTabIndex = 0;
                context.read<DiscussCubit>().tabOnClick(historyTabIndex);
              }
            }),
        BlocListener<LessonCubit, LessonState>(
            listenWhen: (previous, current) =>
                previous.currentLesson != current.currentLesson,
            listener: (context, state) => context
                .read<HistoryCubit>()
                .changeLessonAndFetchData(state.currentLesson!.id)),
        BlocListener<LessonCubit, LessonState>(
            listenWhen: (previous, current) =>
                previous.currentLesson != current.currentLesson,
            listener: (context, state) => context
                .read<CommentCubit>()
                .changeLessonAndFetchData(state.currentLesson!.id)),
      ],
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            const TabBarDiscuss(),
            const Divider(),
            BlocBuilder<DiscussCubit, DiscussState>(
              buildWhen: (previous, current) => previous.tab != current.tab,
              builder: (context, state) {
                switch (state.tab) {
                  case DiscussTab.history:
                    return LessonHistoryTabWidget(controller: controller);
                  case DiscussTab.discuss:
                    return CommentTabWidget(controller: controller);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
