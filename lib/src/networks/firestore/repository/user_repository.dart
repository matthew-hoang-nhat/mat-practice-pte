import '../../f_result.dart';
import '../../models/user/m_user.dart';

abstract class UserRepository {
  Future<FResult<MUser>> getInfoUser({required String uid});
}
