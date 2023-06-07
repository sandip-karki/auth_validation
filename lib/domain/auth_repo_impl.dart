import 'package:firebase_auth/firebase_auth.dart';

import 'package:student/domain/auth_repo.dart';

class AuthRepoImpl extends Authrepo {
  FirebaseAuth? _firebaseAuth;
  AuthRepoImpl() {
    _firebaseAuth = FirebaseAuth.instance;
  }
  @override
  Future<UserCredential> login(
      {required String email, required String password}) async {
    final res = await _firebaseAuth!
        .signInWithEmailAndPassword(email: email, password: password);
    return res;
  }

  @override
  Future register(
      {required String email,
      required String password,
      required String confpassword}) async {
    final res = await _firebaseAuth!
        .createUserWithEmailAndPassword(email: email, password: password);
    return res;
  }
}
