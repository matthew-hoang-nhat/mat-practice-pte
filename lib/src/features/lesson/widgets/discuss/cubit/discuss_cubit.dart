import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/discuss/cubit/comment_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'history_cubit.dart';

part 'discuss_state.dart';

class DiscussCubit extends Cubit<DiscussState> {
  DiscussCubit(this.tabController) : super(DiscussState.init());
  final TabController tabController;
  String get uid => GlobalVariables.auth.currentUser!.uid;

  void scrollOnLoading(BuildContext context) {
    switch (state.tab) {
      case DiscussTab.history:
        context.read<HistoryCubit>().scrollOnLoading();
        break;

      case DiscussTab.discuss:
        context.read<CommentCubit>().scrollOnLoading();
        break;
    }
  }

  void tabOnClick(int index) {
    const tabs = DiscussTab.values;
    tabController.index = index;
    emit(state.copyWith(tab: tabs[index]));
  }
}
