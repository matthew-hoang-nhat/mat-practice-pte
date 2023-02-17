import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/utils/remote/models/lesson_user_data/lesson_user_data.dart';

import '../base_collection_reference.dart';

class LessonUserDataCollectionReference
    extends BaseCollectionReference<LessonUserData> {
  LessonUserDataCollectionReference(String uid)
      : super(
          FirebaseFirestore.instance
              .collection('users')
              .doc(uid)
              .collection(FirebaseCollectionNames.resultUserData)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    LessonUserData.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );
}
