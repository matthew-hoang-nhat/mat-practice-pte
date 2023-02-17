import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mat_practice_pte/src/utils/reference/user_collection_reference.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';
import 'package:mat_practice_pte/src/utils/repository/authenticate_repository.dart';

class AuthenticateRepositoryImpl extends AuthenticateRepository {
  final ref = UserCollectionReference();

  @override
  Future<FResult<String>> registerEmailPassword(
      {required email, required password, required nickname}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final uid = userCredential.user!.uid;
      await ref.set(uid, MUser(uid: uid, nickname: nickname, email: email));
      return FResult.success('Successfully Register');
    } on FirebaseAuthException catch (e) {
      return FResult.error(e.code);
    } catch (e) {
      return FResult.error(e.toString());
    }
  }

  @override
  Future<FResult<UserCredential>> loginWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();

      final isSigned = await googleSignIn.isSignedIn();
      if (isSigned) {
        googleSignIn.signOut();
      }

      GoogleSignInAccount? account = await googleSignIn.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await account?.authentication;

      // Create a new credential
      final oauthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final credential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return FResult.success(credential);
    } catch (ex) {
      return FResult.error('Lỗi rồi');
    }
  }

  @override
  Future<FResult<UserCredential>> loginWithEmailPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return FResult.success(credential);
    } on FirebaseAuthException catch (ex) {
      return FResult.error(ex.code);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }

  @override
  Future<FResult<String>> sendPasswordResetEmail(
      {required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return FResult.success('Sucessfully');
    } on FirebaseAuthException catch (e) {
      return FResult.error(e.code);
    } catch (ex) {
      return FResult.error(ex.toString());
    }
  }
}
