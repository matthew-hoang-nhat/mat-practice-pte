import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/utils/base_collection_reference.dart';

import 'package:mat_practice_pte/src/utils/remote/models/detail_lesson.dart';

import 'category_collection_reference.dart';

class RawLessonCollectionReference
    extends BaseCollectionReference<DetailLesson> {
  RawLessonCollectionReference(String idCategory)
      : super(
          CategoryCollectionReference()
              .ref
              .doc(idCategory)
              .collection(FirebaseCollectionNames.lessons)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    DetailLesson.fromMap(snapshot.data()!),
                toFirestore: (value, options) => value.toMap(),
              ),
        );
}
