import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/networks/firestore/base_collection_reference.dart';
import 'package:mat_practice_pte/src/networks/models/user/m_user.dart';

class UserCollectionReference extends BaseCollectionReference<MUser> {
  UserCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection(FirebaseCollectionNames.users)
              .withConverter(
                fromFirestore: (snapshot, options) =>
                    MUser.fromJson(snapshot.data()!),
                toFirestore: (value, options) => value.toJson(),
              ),
        );
}
