import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/networks/firestore/base_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_discuss.dart';

class LessonDiscussCollectionReference
    extends BaseCollectionReference<LessonDiscuss> {
  LessonDiscussCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection(FirebaseCollectionNames.lessonDiscuss)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    LessonDiscuss.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );

  Query<LessonDiscuss> queryParentDiscusses(
      {Query<LessonDiscuss>? query,
      required String idCategory,
      required String idLesson}) {
    return query != null
        ? query
            .where('idParent', isNull: true)
            .where('idCategory', isEqualTo: idCategory)
            .where('idLesson', isEqualTo: idLesson)
        : ref
            .where('idParent', isNull: true)
            .where('idCategory', isEqualTo: idCategory)
            .where('idLesson', isEqualTo: idLesson);
  }

  // Query<LessonDiscuss> queryChildrenDiscusses(
  //     {Query<LessonDiscuss>? query, required String idParent}) {
  //   return query != null
  //       ? query.where('idParent', isEqualTo: idParent)
  //       : ref.where('idParent', isNotEqualTo: idParent);
  // }
}
