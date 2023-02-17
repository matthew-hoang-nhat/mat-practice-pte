import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';

import '../reference/user_collection_reference.dart';
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
