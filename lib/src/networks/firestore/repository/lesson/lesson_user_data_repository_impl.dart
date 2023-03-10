import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_history_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_user_data_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'lesson_user_data_repository.dart';

enum TypeFilter { mark, practiced }

class LessonUserDataRepositoryImpl extends LessonUserDataRepository {
  String get uid => GlobalVariables.getIt<FUser>().firebaseUser!.uid;
  final lessonDataRef = LessonUserDataCollectionReference();
  final historyRef = LessonHistoryCollectionReference();

  @override
  Future<FResult<List<LessonUserData>>> getLessonUserDatas(
      {required String idCategory,
      required FilterMarkEnum? filterMark,
      required FilterPracticedEnum? filterPracticed,
      required FetchArrowType fetchArrowType,
      required bool isQNumDescending,
      String? lastIdLesson}) async {
    try {
      Query query = lessonDataRef.queryLessonUserDatasFilter(
          uid: uid,
          idCategory: idCategory,
          filterMark: filterMark,
          filterPracticed: filterPracticed);

      final docs = [];
      if (lastIdLesson == null) {
        final result = await query
            .orderBy('idLesson', descending: isQNumDescending)
            .limit(5)
            .get();
        docs.addAll(result.docs);
      } else {
        final lastDocs =
            await query.where('idLesson', isEqualTo: lastIdLesson).get();
        final lastDoc = lastDocs.docs.first;
        if (fetchArrowType == FetchArrowType.next) {
          final result = await query
              .orderBy('idLesson', descending: isQNumDescending)
              .startAfterDocument(lastDoc)
              .limit(5)
              .get();
          docs.addAll(result.docs);
        } else {
          final result = await query
              .orderBy('idLesson', descending: isQNumDescending)
              .endBeforeDocument(lastDoc)
              .limit(5)
              .get();
          docs.addAll(result.docs);
        }
      }

      final List<LessonUserData> userLessons = [];
      for (var doc in docs) {
        userLessons.add(doc.data());
      }

      return FResult.success(userLessons);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<LessonUserData>> getLessonUserData({
    required String idLesson,
    required String idCategory,
  }) async {
    try {
      final lessonUserDataSnapshot = await lessonDataRef
          .queryLesson(uid: uid, idCategory: idCategory, idLesson: idLesson)
          .get();

      var lessonUserData = lessonUserDataSnapshot.docs.first.data();

      return FResult.success(lessonUserData);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<int>> getCountFoundLessonWithFilter(
      {required String idCategory,
      FilterMarkEnum? filterMark,
      FilterPracticedEnum? filterPracticed}) async {
    try {
      final countSnapshot = await lessonDataRef
          .queryLessonUserDatasFilter(
              uid: uid,
              idCategory: idCategory,
              filterMark: filterMark,
              filterPracticed: filterPracticed)
          .count()
          .get();

      final count = countSnapshot.count;
      return FResult.success(count);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  Future<FResult<int>> getCountTimesPracticed(
      {required String idCategory, required String idLesson}) async {
    try {
      final snapShot = await historyRef
          .queryLessons(uid: uid, idCategory: idCategory, idLesson: idLesson)
          .count()
          .get();

      return FResult.success(snapShot.count);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
