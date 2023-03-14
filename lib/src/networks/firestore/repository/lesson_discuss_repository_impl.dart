import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_discuss_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_user_data_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/discuss_reaction.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_discuss.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'lesson_discuss_repository.dart';

class LessonDiscussRepositoryImpl extends LessonDiscussRepository {
  final _discussRef = LessonDiscussCollectionReference();

  final limit = 5;

  @override
  Future<FResult<List<LessonDiscuss>>> getDiscusses(
      String idCategory, String idLesson,
      {String? idLastHistory}) async {
    try {
      final bool isAfterDoc = idLastHistory != null;
      QuerySnapshot<LessonDiscuss> snapshots;
      if (isAfterDoc) {
        final lastDoc = await _discussRef.ref.doc(idLastHistory).get();
        snapshots = await _discussRef
            .queryParentDiscusses(idCategory: idCategory, idLesson: idLesson)
            .startAfterDocument(lastDoc)
            .limit(limit)
            .get();
      } else {
        snapshots = await _discussRef
            .queryParentDiscusses(idCategory: idCategory, idLesson: idLesson)
            .limit(limit)
            .get();
      }
      List<LessonDiscuss> discusses = [];
      for (var item in snapshots.docs) {
        final discuss = item.data();
        discusses.add(discuss.copyWith(id: item.id));
      }

      // final childrenDiscussFutures = discusses
      //     .map((e) => _discussRef.queryChildrenDiscusses(idParent: e.id!).get())
      //     .toList();

      // final childrenDiscussSnapshots =
      //     await Future.wait(childrenDiscussFutures);

      // for (int index = 0; index < discusses.length; index++) {
      //   final replies =
      //       childrenDiscussSnapshots[index].docs.map((e) => e.data()).toList();
      //   discusses[index] = discusses[index].copyWith(replies: replies);
      // }

      return FResult.success(discusses);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  final userDataRef = LessonUserDataCollectionReference();
  String get uid => GlobalVariables.auth.currentUser!.uid;

  @override
  Future<FResult<String>> removeDiscuss(String id) async {
    try {
      await _discussRef.delete(id);
      return FResult.success('Successfully React');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> addDiscuss(LessonDiscuss discuss) async {
    try {
      await _discussRef.add(discuss);
      return FResult.success('Successfully React');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> replyDiscuss(
      String idParent, LessonDiscuss discuss) async {
    try {
      await _discussRef.add(discuss.copyWith(idParent: idParent));

      return FResult.success('Successfully React');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> reactDiscuss(String id, String reaction) async {
    // try {

    final discuss = await _discussRef.get(id);

    if (discuss == null) return FResult.error('Not found discuss');

    final isMeReacted =
        discuss.reactions.where((element) => element.uid == uid).isNotEmpty;

    if (isMeReacted) {
      // final discussReaction =
      //     discuss.reactions.where((element) => element.uid == uid).first;
      // final index = discuss.reactions.indexOf(discussReaction);

      // final newReactions = discuss.reactions;
      // newReactions[index] = discussReaction.copyWith(reaction: reaction);

      // await _discussRef.set(id, discuss.copyWith(reactions: newReactions));
      return FResult.success('Nothing to react');
    } else {
      final discussReaction = DiscussReaction(uid: uid, reaction: reaction);
      final newReactions = <DiscussReaction>[
        ...discuss.reactions,
        discussReaction
      ];
      await _discussRef.set(id, discuss.copyWith(reactions: newReactions));
    }

    return FResult.success('Successfully React');
    // } catch (ex) {
    //   return FResult.error(ex.toString());
    // }
  }

  @override
  Future<FResult<String>> removeReactDiscuss(String id) async {
    // try {
    final discuss = await _discussRef.get(id);

    if (discuss == null) return FResult.error('Not found discuss');

    final isMeReacted =
        discuss.reactions.where((element) => element.uid == uid).isNotEmpty;

    if (isMeReacted) {
      final indexMyDiscussReaction =
          discuss.reactions.indexWhere((element) => element.uid == uid);

      final newReactions = List<DiscussReaction>.from(discuss.reactions);
      newReactions.removeAt(indexMyDiscussReaction);

      await _discussRef.set(id, discuss.copyWith(reactions: newReactions));
    }

    return FResult.success('Successfully React');
    // } catch (ex) {
    //   return FResult.error(ex.toString());
    // }
  }
}
