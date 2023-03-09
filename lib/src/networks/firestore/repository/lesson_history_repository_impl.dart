import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_history_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson_history_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';

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
      if (isAfterDoc) {
        final lastDoc = await _historyRef.ref.doc(idLastHistory).get();
        snapshots = await _historyRef.ref
            .orderBy('timeCreated', descending: true)
            .where('idLesson', isEqualTo: idLesson)
            .where('idCategory', isEqualTo: idCategory)
            .where('uid', isEqualTo: uid)
            .startAfterDocument(lastDoc)
            .limit(limit)
            .get();
      } else {
        snapshots = await _historyRef.ref
            .orderBy('timeCreated', descending: true)
            .where('idLesson', isEqualTo: idLesson)
            .where('idCategory', isEqualTo: idCategory)
            .where('uid', isEqualTo: uid)
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
      await _historyRef.delete(id);
      return FResult.success('Thành công');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
