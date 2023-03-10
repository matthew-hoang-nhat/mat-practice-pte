import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/networks/firestore/base_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/lesson/lesson_user_data_repository_impl.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_user_data/lesson_user_data.dart';

class LessonUserDataCollectionReference
    extends BaseCollectionReference<LessonUserData> {
  LessonUserDataCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection(FirebaseCollectionNames.lessonUserData)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    LessonUserData.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  Query<LessonUserData> _queryMark(
      Query<LessonUserData> query, FilterMarkEnum filterMark) {
    final markStr = filterMark.toString();
    switch (filterMark) {
      case FilterMarkEnum.red:
      case FilterMarkEnum.grey:
        query = query.where('codeMark', isEqualTo: markStr);
        break;
      case FilterMarkEnum.allMark:
        query = query.where('codeMark', isNotEqualTo: null);
        break;
      default:
    }
    return query;
  }

  Query<LessonUserData> _queryPracticed(
      Query<LessonUserData> query, FilterPracticedEnum filterPracticed) {
    switch (filterPracticed) {
      case FilterPracticedEnum.practiced:
        query = query
            .where('countPracticed', isGreaterThan: 0)
            .orderBy('countPracticed');
        break;
      default:
    }
    return query;
  }

  Query<LessonUserData> queryLessonUserDatasFilter(
      {required String uid,
      required String idCategory,
      FilterMarkEnum? filterMark,
      FilterPracticedEnum? filterPracticed}) {
    Query<LessonUserData> query = ref
        .where('uid', isEqualTo: uid)
        .where('idCategory', isEqualTo: idCategory);

    TypeFilter? type = filterMark != null ? TypeFilter.mark : null;
    type = filterPracticed != null ? TypeFilter.practiced : type;

    switch (type) {
      case TypeFilter.mark:
        query = _queryMark(query, filterMark!);
        break;
      case TypeFilter.practiced:
        query = _queryPracticed(query, filterPracticed!);
        break;
      default:
    }

    return query;
  }

  Query<LessonUserData> queryLesson(
      {Query<LessonUserData>? query,
      required String uid,
      required String idCategory,
      required String idLesson}) {
    return query != null
        ? query
            .where('uid', isEqualTo: uid)
            .where('idCategory', isEqualTo: idCategory)
            .where('idLesson', isEqualTo: idLesson)
        : ref
            .where('uid', isEqualTo: uid)
            .where('idCategory', isEqualTo: idCategory)
            .where('idLesson', isEqualTo: idLesson);
  }
}
