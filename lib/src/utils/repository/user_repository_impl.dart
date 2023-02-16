import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mat_practice_pte/src/configs/constants/firebase_collection_names.dart';
import 'package:mat_practice_pte/src/utils/base_collection_reference.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';

import 'user_repository.dart';

class UserRepositoryImpl extends BaseCollectionReference<MUser>
    implements UserRepository {
  UserRepositoryImpl(FirebaseFirestore firestore)
      : super(
          firestore.collection(FirebaseCollectionNames.users).withConverter(
                fromFirestore: (snapshot, options) =>
                    MUser.fromMap(snapshot.data()!),
                toFirestore: (value, options) => value.toMap(),
              ),
        );
  @override
  Future<FResult<MUser>> getInfoUser({required String uid}) async {
    try {
      final user = await get(uid);
      return FResult.success(user);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
