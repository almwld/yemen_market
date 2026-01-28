import 'package:firebase_auth/firebase_auth.dart';
import 'user_firestore_service.dart';
import '../models/app_user.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _userDb = UserFirestoreService();

  Future<AppUser> login(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    return _userDb.getUser(cred.user!.uid);
  }

  Future<AppUser> register(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await _userDb.createUser(
      uid: cred.user!.uid,
      email: email,
      role: 'user',
    );

    return _userDb.getUser(cred.user!.uid);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
