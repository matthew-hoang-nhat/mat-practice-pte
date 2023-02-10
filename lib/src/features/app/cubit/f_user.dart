import 'package:firebase_auth/firebase_auth.dart';

class FUser {
  bool get isLogged => FirebaseAuth.instance.currentUser != null;
  User? get user => FirebaseAuth.instance.currentUser;
  Future<void> signOut() => FirebaseAuth.instance.signOut();
}
