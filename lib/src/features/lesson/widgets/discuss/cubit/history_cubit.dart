import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit({required this.controller, required this.idCategory})
      : super(HistoryState.init());

  final RefreshController controller;
  final String idCategory;
  final fShows = GlobalVariables.getIt<FApp>();
  final fLocate = GlobalVariables.getIt<FLocate>();
  final lessonHistoryRepo = DomainManager.instance.lessonHistoryRepository;
  String get uid => GlobalVariables.auth.currentUser!.uid;

  Future<void> refreshLessonHistories() async {
    emit(state.copyWith(lessonHistories: []));
    _loadLessonHistories();
  }

  Future<void> scrollOnLoading() async {
    await _loadLessonHistories();
    controller.loadComplete();
  }

  void changeLessonAndFetchData(String id) {
    emit(state.copyWith(idLesson: id));
    refreshLessonHistories();
  }

  Future<void> _loadLessonHistories() async {
    final idLastHistory =
        state.lessonHistories.isEmpty ? null : state.lessonHistories.last.id;

    final lessonHistoriesResult = await lessonHistoryRepo.getLessonHistories(
      uid,
      idCategory,
      state.idLesson,
      idLastHistory: idLastHistory,
    );

    fetchResource(lessonHistoriesResult, onSuccess: () {
      final newLessonHistories = <LessonHistory>[
        ...state.lessonHistories,
        ...lessonHistoriesResult.data!
      ];
      emit(state.copyWith(lessonHistories: newLessonHistories));
    }, onError: () {
      Logger().e('Thất bại');
    });
  }

  void removeHistoryLessonOnClick(BuildContext context, String id) async {
    fShows.showAlertDialog(context,
        type: FShowType.warning,
        body: fLocate.str(FLocalKey.removeLessonHistoryLabel),
        actions: [
          {fLocate.str(FLocalKey.cancel): () {}}
        ],
        redAction: {
          fLocate.str(FLocalKey.delete): () => _removeLessonHistory(id)
        });
  }

  Future<void> refreshLessonHistoriesAfterId(
      String uid, String idCategory, String idLesson, String id) async {
    final indexLessonHistoryRemove =
        state.lessonHistories.indexWhere((element) => element.id == id);

    final isFirstItem = indexLessonHistoryRemove == 0;
    final idLastHistory = isFirstItem
        ? null
        : state.lessonHistories[indexLessonHistoryRemove - 1].id;

    final lessonHistoriesResult = await lessonHistoryRepo.getLessonHistories(
        uid, idCategory, idLesson,
        idLastHistory: idLastHistory);

    fetchResource(lessonHistoriesResult, onSuccess: () {
      final lessonHistoriesBeforeId =
          state.lessonHistories.sublist(0, indexLessonHistoryRemove);
      final lessonHistoriesAfterId = lessonHistoriesResult.data!;

      emit(state.copyWith(
          lessonHistories: lessonHistoriesBeforeId + lessonHistoriesAfterId));
    });
  }

  Future<void> _removeLessonHistory(String id) async {
    await lessonHistoryRepo.removeLessonHistory(id);
    await refreshLessonHistoriesAfterId(uid, idCategory, state.idLesson, id);
  }
}
