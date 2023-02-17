import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';

import '../base_collection_reference.dart';

class UserCollectionReference extends BaseCollectionReference<MUser> {
  UserCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection(FirebaseCollectionNames.users)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    MUser.fromMap(snapshot.data()!),
                toFirestore: (value, options) => value.toMap(),
              ),
        );
}
