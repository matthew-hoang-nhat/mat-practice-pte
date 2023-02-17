import 'package:mat_practice_pte/src/features/app/cubit/f_user.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/detail_lesson.dart';

import '../../reference/category_collection_reference.dart';
import '../../reference/raw_lesson_collection_reference.dart';
import 'raw_lesson_repository.dart';

class RawLessonRepositoryImpl extends RawLessonRepository {
  final categoryRef = CategoryCollectionReference();
  RawLessonCollectionReference lessonsRef(String idCategory) =>
      RawLessonCollectionReference(idCategory);

  String? get uid => GlobalVariables.getIt<FUser>().firebaseUser?.uid;

  @override
  Future<FResult<List<DetailLesson>>> getRawLessons({
    required String idCategory,
    String? lastIdLesson,
    required bool isQNumDescending,
  }) async {
    try {
      final lessons = <DetailLesson>[];
      if (lastIdLesson == null) {
        final result = await lessonsRef(idCategory)
            .ref
            .orderBy('id', descending: isQNumDescending)
            .limit(5)
            .get();

        lessons.addAll(result.docs.map((e) => e.data()).toList());
      } else {
        final lastDocs = await lessonsRef(idCategory)
            .ref
            .where('id', isEqualTo: lastIdLesson)
            .get();
        final lastDoc = lastDocs.docs.first;
        final result = await lessonsRef(idCategory)
            .ref
            .orderBy('id', descending: isQNumDescending)
            .startAfterDocument(lastDoc)
            .limit(5)
            .get();
        lessons.addAll(result.docs.map((e) => e.data()).toList());
      }
      return FResult.success(lessons);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<DetailLesson>> getRawDetailLesson(
      {required String idCategory, required String idLesson}) async {
    try {
      final lessonSnapshot = await lessonsRef(idCategory)
          .ref
          .where('id', isEqualTo: idLesson)
          .get();
      final lesson = lessonSnapshot.docs.first.data();
      return FResult.success(lesson);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<int>> getRawCountFoundLesson(
      {required String idCategory}) async {
    try {
      final result = await lessonsRef(idCategory).ref.count().get();
      final count = result.count;
      return FResult.success(count);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
