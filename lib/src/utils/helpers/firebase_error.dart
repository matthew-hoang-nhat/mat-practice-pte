import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';

class FFirebaseError {
  static final fLocate = GlobalVariables.getIt<FLocate>();
  static String errorToAnnounce({required String code}) {
    switch (code) {
      case 'weak-password':
        return fLocate.str(FLocalKey.weakPassword);

      case 'email-already-in-use':
        return fLocate.str(FLocalKey.emailAlreadyInUse);

      case 'invalid-email':
        return fLocate.str(FLocalKey.invalidEmail);
      case 'user-not-found':
        return fLocate.str(FLocalKey.userNotFound);

      default:
        return 'Unknown';
    }
  }
}
