import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/mark_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import '../reference/lesson_user_data_collection_reference.dart';

class MarkRepositoryImpl extends MarkRepository {
  String get uid => GlobalVariables.getIt<FUser>().firebaseUser!.uid;
  late final userDataref = LessonUserDataCollectionReference();

  @override
  Future<FResult<String>> doMark(
      {required String idLesson,
      required String idCategory,
      required String mark}) async {
    try {
      final lessonUserDataSnapshot = await userDataref
          .queryLesson(uid: uid, idCategory: idCategory, idLesson: idLesson)
          .get();

      final isExist = lessonUserDataSnapshot.docs.isNotEmpty;
      if (isExist) {
        final doc = lessonUserDataSnapshot.docs.first;
        final lessonUserData = doc.data();
        userDataref.ref
            .doc(doc.id)
            .set(lessonUserData.copyWith(codeMark: mark));
      } else {
        final newLessonUserData = LessonUserData(
            idLesson: idLesson,
            idCategory: idCategory,
            codeMark: mark,
            countPracticed: 0,
            uid: uid);
        userDataref.add(newLessonUserData);
      }
      return FResult.success('Successfully add mark');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> refetchMark(
      {required String idLesson, required String idCategory}) async {
    try {
      final lessonUserDataSnapshot = await userDataref
          .queryLesson(uid: uid, idCategory: idCategory, idLesson: idLesson)
          .get();

      final isExist = lessonUserDataSnapshot.docs.isNotEmpty;
      if (isExist) {
        final doc = lessonUserDataSnapshot.docs.first;
        return FResult.success(doc.data().codeMark);
      }
      return FResult.error('Not found');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> unMark({
    required String idLesson,
    required String idCategory,
  }) async {
    try {
      final lessonUserDataSnapshot = await userDataref
          .queryLesson(uid: uid, idCategory: idCategory, idLesson: idLesson)
          .get();

      final isExist = lessonUserDataSnapshot.docs.isNotEmpty;
      if (isExist) {
        final doc = lessonUserDataSnapshot.docs.first;
        userDataref.ref.doc(doc.id).delete();
      }
      return FResult.success('Successfully un mark');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
