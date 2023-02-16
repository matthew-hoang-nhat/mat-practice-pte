import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';

abstract class UserRepository {
  Future<FResult<MUser>> getInfoUser({required String uid});
}
