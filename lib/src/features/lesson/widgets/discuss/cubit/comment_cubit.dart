import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/discuss_reaction.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_discuss.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit({required this.controller, required this.idCategory})
      : super(CommentState.init());

  final RefreshController controller;
  final String idCategory;
  final fShows = GlobalVariables.getIt<FApp>();
  final fLocate = GlobalVariables.getIt<FLocate>();
  final discussRepo = DomainManager.instance.discussRepository;
  final userRepo = DomainManager.instance.userRepository;
  String get uid => GlobalVariables.auth.currentUser!.uid;

  Future<void> refreshDiscusses() async {
    emit(state.copyWith(discusses: []));
    _loadDiscusses();
  }

  Future<void> scrollOnLoading() async {
    await _loadDiscusses();
    controller.loadComplete();
  }

  void changeLessonAndFetchData(String id) {
    emit(state.copyWith(idLesson: id));
    refreshDiscusses();
  }

  void removeHistoryLessonOnClick(BuildContext context, String id) async {
    fShows.showAlertDialog(context,
        type: FShowType.warning,
        body: fLocate.str(FLocalKey.removeLessonDiscussLabel),
        actions: [
          {fLocate.str(FLocalKey.cancel): () {}}
        ],
        redAction: {
          fLocate.str(FLocalKey.delete): () => _removeDiscuss(id)
        });
  }

  Future<void> _loadDiscusses() async {
    final idLastHistory =
        state.lessonDiscusses.isEmpty ? null : state.lessonDiscusses.last.id;

    final discussesResult = await discussRepo
        .getDiscusses(idCategory, state.idLesson, idLastHistory: idLastHistory);

    fetchResource(discussesResult, onSuccess: () async {
      List<LessonDiscuss> discusses = discussesResult.data!;
      discusses = await mergedUserInforDiscusses(discusses);
      final newDiscusses = <LessonDiscuss>[
        ...state.lessonDiscusses,
        ...discusses
      ];
      emit(state.copyWith(discusses: newDiscusses));
    }, onError: () {
      Logger().e('Thất bại');
    });
  }

  Future<List<LessonDiscuss>> mergedUserInforDiscusses(
      List<LessonDiscuss> discusses) async {
    final userInforFutures = discusses
        .map((discuss) => userRepo.getInfoUser(uid: discuss.uid))
        .toList();
    final userInforResults = await Future.wait(userInforFutures);

    for (int index = 0; index < discusses.length; index++) {
      final userInfor = userInforResults.elementAt(index).data;
      discusses[index] = discusses[index].copyWith(
          avatar: userInfor?.avatarUrl, username: userInfor?.nickname);
    }
    return discusses;
  }

  Future<void> refreshLessonHistoriesAfterId(
      String uid, String idCategory, String idLesson, String id) async {
    final indexLessonHistoryRemove =
        state.lessonDiscusses.indexWhere((element) => element.id == id);

    final isFirstItem = indexLessonHistoryRemove == 0;
    final idLastHistory = isFirstItem
        ? null
        : state.lessonDiscusses[indexLessonHistoryRemove - 1].id;

    final lessonHistoriesResult = await discussRepo
        .getDiscusses(idCategory, idLesson, idLastHistory: idLastHistory);

    fetchResource(lessonHistoriesResult, onSuccess: () async {
      final lessonHistoriesBeforeId =
          state.lessonDiscusses.sublist(0, indexLessonHistoryRemove);
      final lessonHistoriesAfterId =
          await mergedUserInforDiscusses(lessonHistoriesResult.data!);

      emit(state.copyWith(
          discusses: lessonHistoriesBeforeId + lessonHistoriesAfterId));
    });
  }

  Future<void> _removeDiscuss(String id) async {
    await discussRepo.removeDiscuss(id);
    await refreshLessonHistoriesAfterId(uid, idCategory, state.idLesson, id);
  }

  reactOnTap(String id) {
    final index =
        state.lessonDiscusses.indexWhere((element) => element.id == id);

    final isReacted = state.lessonDiscusses[index].reactions
        .where((element) => element.uid == uid)
        .isNotEmpty;

    var lessonDiscusses = List<LessonDiscuss>.from(state.lessonDiscusses);

    if (isReacted) {
      discussRepo.removeReactDiscuss(id);
      lessonDiscusses[index] =
          _updateDiscuss(lessonDiscusses[index], uid, null);
    } else {
      final reaction = ReactionComments.like.toString();
      discussRepo.reactDiscuss(id, reaction);
      lessonDiscusses[index] = _updateDiscuss(lessonDiscusses[index], uid,
          DiscussReaction(reaction: reaction, uid: uid));
    }

    emit(state.copyWith(discusses: lessonDiscusses));
  }

  LessonDiscuss _updateDiscuss(
      LessonDiscuss discuss, String uid, DiscussReaction? newReaction) {
    final newReactions = List<DiscussReaction>.from(discuss.reactions);

    if (newReaction == null) {
      newReactions.removeWhere((element) => element.uid == uid);
    } else {
      newReactions.add(newReaction);
    }

    return discuss.copyWith(reactions: newReactions);
  }
}
