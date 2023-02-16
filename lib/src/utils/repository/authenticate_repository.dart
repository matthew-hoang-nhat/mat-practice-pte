import 'package:firebase_auth/firebase_auth.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';

abstract class AuthenticateRepository {
  Future<FResult<String>> registerEmailPassword(
      {required email, required password, required nickname});
  Future<FResult<UserCredential>> loginWithGoogle();
  Future<FResult<UserCredential>> loginWithEmailPassword(
      {required String email, required String password});
  Future<FResult<String>> sendPasswordResetEmail({required String email});
}
