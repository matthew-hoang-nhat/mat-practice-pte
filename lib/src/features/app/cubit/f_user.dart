import 'package:firebase_auth/firebase_auth.dart';
import 'package:mat_practice_pte/src/utils/remote/models/m_user.dart';

class FUser {
  bool get isLogged => FirebaseAuth.instance.currentUser != null;
  User? get firebaseUser => FirebaseAuth.instance.currentUser;
  MUser? user;

  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
