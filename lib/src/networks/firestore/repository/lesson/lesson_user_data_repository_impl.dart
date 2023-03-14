import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_user_data_collection_reference.dart';

import 'lesson_user_data_repository.dart';

class LessonUserDataRepositoryImpl extends LessonUserDataRepository {
  CollectionReference<LessonUserData> lessonUserDataRef(String uid) =>
      LessonUserDataCollectionReference(uid).ref;
  String get uid => GlobalVariables.getIt<FUser>().firebaseUser!.uid;

  @override
  Future<FResult<List<LessonUserData>>> getUserLessons(
      {required String idCategory,
      required FilterMarkEnum? filterMark,
      required FilterPracticedEnum? filterPracticed,
      required bool isQNumDescending,
      String? lastIdLesson}) async {
    try {
      Query query =
          lessonUserDataRef(uid).where('id_category', isEqualTo: idCategory);
      final markStr = filterMark.toString();

      switch (filterMark) {
        case FilterMarkEnum.red:
        case FilterMarkEnum.grey:
          query = query.where('mark', isEqualTo: markStr);
          break;

        case FilterMarkEnum.allMark:
          query = query.where('mark', isNotEqualTo: null);
          break;

        default:
      }

      switch (filterPracticed) {
        case FilterPracticedEnum.practiced:
          query = query.where('practiced', isNotEqualTo: null);
          break;

        default:
      }

      final docs = [];
      if (lastIdLesson == null) {
        final result = await query
            .orderBy('id', descending: isQNumDescending)
            .limit(5)
            .get();
        docs.addAll(result.docs);
      } else {
        final lastDocs = await query.where('id', isEqualTo: lastIdLesson).get();
        final lastDoc = lastDocs.docs.first;
        final result = await query
            .startAfterDocument(lastDoc)
            .orderBy('id', descending: isQNumDescending)
            .limit(5)
            .get();
        docs.addAll(result.docs);
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
      final result = await lessonUserDataRef(uid)
          .where('id_category', isEqualTo: idCategory)
          .where('id', isEqualTo: idLesson)
          .get();

      final lessonUserData = result.docs.first.data();

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
      dynamic query =
          lessonUserDataRef(uid).where('id_category', isEqualTo: idCategory);
      final markStr = filterMark.toString();
      switch (filterMark) {
        case FilterMarkEnum.red:
        case FilterMarkEnum.grey:
          query = query.where('mark', isEqualTo: markStr);
          break;

        case FilterMarkEnum.allMark:
          query = query.where('mark', isNotEqualTo: null);
          break;

        default:
      }
      switch (filterPracticed) {
        case FilterPracticedEnum.practiced:
          query = query.where('practiced', isNotEqualTo: null);
          break;

        default:
      }
      final result = await query.count().get();
      final count = result.count;
      return FResult.success(count);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
