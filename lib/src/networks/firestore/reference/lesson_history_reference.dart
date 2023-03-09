import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/networks/firestore/base_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_history.dart';

class LessonHistoryCollectionReference
    extends BaseCollectionReference<LessonHistory> {
  LessonHistoryCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection(FirebaseCollectionNames.lessonHistory)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    LessonHistory.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );
}
