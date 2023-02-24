import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/lesson_user_data_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/mark_repository.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

class MarkRepositoryImpl extends MarkRepository {
  String get uid => GlobalVariables.getIt<FUser>().firebaseUser!.uid;
  late final ref = LessonUserDataCollectionReference(uid).ref;

  @override
  Future<FResult<String>> doMark(
      {required String idLesson,
      required String idCategory,
      required String mark}) async {
    try {
      final lessonUserDataSnapshot = await ref
          .where('id', isEqualTo: idLesson)
          .where('id_category', isEqualTo: idCategory)
          .get();

      final isExist = lessonUserDataSnapshot.docs.isNotEmpty;
      if (isExist) {
        final doc = lessonUserDataSnapshot.docs.first;
        final lessonUserData = doc.data();
        ref.doc(doc.id).set(lessonUserData.copyWith(mark: mark));
      } else {
        final newLessonUserData = LessonUserData(
            id: idLesson, idCategory: idCategory, mark: mark, practiced: 0);
        ref.add(newLessonUserData);
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
      final lessonUserDataSnapshot = await ref
          .where('id', isEqualTo: idLesson)
          .where('id_category', isEqualTo: idCategory)
          .get();

      final isExist = lessonUserDataSnapshot.docs.isNotEmpty;
      if (isExist) {
        final doc = lessonUserDataSnapshot.docs.first;
        return FResult.success(doc.data().mark);
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
      final lessonUserDataSnapshot = await ref
          .where('id', isEqualTo: idLesson)
          .where('id_category', isEqualTo: idCategory)
          .get();

      final isExist = lessonUserDataSnapshot.docs.isNotEmpty;
      if (isExist) {
        final doc = lessonUserDataSnapshot.docs.first;
        ref.doc(doc.id).delete();
      }
      return FResult.success('Successfully un mark');
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
