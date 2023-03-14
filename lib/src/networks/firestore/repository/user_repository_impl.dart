import 'package:mat_practice_pte/src/networks/f_result.dart';
import 'package:mat_practice_pte/src/networks/models/user/m_user.dart';
import 'package:mat_practice_pte/src/networks/firestore/reference/user_collection_reference.dart';

import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final ref = UserCollectionReference();

  @override
  Future<FResult<MUser>> getInfoUser({required String uid}) async {
    try {
      final user = await ref.get(uid);
      return FResult.success(user);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
