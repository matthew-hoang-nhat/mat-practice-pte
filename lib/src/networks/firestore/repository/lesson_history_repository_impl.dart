import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_user_data_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson_history_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import '../reference/lesson_history_collection_reference.dart';

class LessonHistoryRepositoryImpl extends LessonHistoryRepository {
  final _historyRef = LessonHistoryCollectionReference();

  final limit = 5;

  @override
  Future<FResult<List<LessonHistory>>> getLessonHistories(
      String uid, String idCategory, String idLesson,
      {String? idLastHistory}) async {
    try {
      final bool isAfterDoc = idLastHistory != null;
      QuerySnapshot<LessonHistory> snapshots;
      Query<LessonHistory> queryOrderByTime =
          _historyRef.ref.orderBy('timeCreated', descending: true);
      if (isAfterDoc) {
        final lastDoc = await _historyRef.ref.doc(idLastHistory).get();

        snapshots = await _historyRef
            .queryLesson(
                query: queryOrderByTime,
                uid: uid,
                idCategory: idCategory,
                idLesson: idLesson)
            .startAfterDocument(lastDoc)
            .limit(limit)
            .get();
      } else {
        snapshots = await _historyRef
            .queryLesson(
                query: queryOrderByTime,
                uid: uid,
                idCategory: idCategory,
                idLesson: idLesson)
            .limit(limit)
            .get();
      }

      return FResult.success(
          snapshots.docs.map((e) => e.data().copyWith(id: e.id)).toList());
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> removeLessonHistory(String id) async {
    try {
      final lessonUserData = await _historyRef.get(id);
      await _historyRef.delete(id);
      _fetchAndSetCountPracticed(
          lessonUserData!.idCategory, lessonUserData.idLesson);
      return FResult.success('Thành công');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  final userDataRef = LessonUserDataCollectionReference();
  String get uid => GlobalVariables.auth.currentUser!.uid;

  Future<void> _fetchAndSetCountPracticed(
      String idCategory, String idLesson) async {
    final userDataSnapshot = await userDataRef
        .queryLesson(uid: uid, idCategory: idCategory, idLesson: idLesson)
        .get();

    final countPracticedSnapshot = await _historyRef
        .queryLesson(uid: uid, idCategory: idCategory, idLesson: idLesson)
        .count()
        .get();

    final isExistedUserData = countPracticedSnapshot.count > 1;

    if (isExistedUserData) {
      final countPracticed = countPracticedSnapshot.count;
      final oldUserData = userDataSnapshot.docs.first.data();
      final idDoc = userDataSnapshot.docs.first.id;

      await userDataRef.set(
          idDoc, oldUserData.copyWith(countPracticed: countPracticed));
    } else {
      final newUserData = LessonUserData(
          uid: uid,
          idLesson: idLesson,
          idCategory: idCategory,
          codeMark: null,
          countPracticed: 1);
      await userDataRef.add(newUserData);
    }
  }
}
