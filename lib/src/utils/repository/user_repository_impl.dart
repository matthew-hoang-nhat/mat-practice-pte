import 'package:logger/logger.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';

import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  @override
  Future<FResult<MUser>> getInfoUser({required String uid}) async {
    try {
      final userMap =
          await GlobalVariables.firestore.collection('users').doc(uid).get();

      final user = MUser.fromMap(userMap.data()!);
      Logger().i(user);
      return FResult.success(user);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
