import 'package:firebase_auth/firebase_auth.dart';
import 'user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel?> login(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;
    if (user == null) return null;

    return UserModel(
      uid: user.uid,
      name: user.displayName ?? '',
      email: user.email ?? '',
    );
  }

  Future<UserModel?> register(
    String name,
    String email,
    String password,
  ) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = result.user;
    if (user == null) return null;

    await user.updateDisplayName(name);

    return UserModel(
      uid: user.uid,
      name: name,
      email: email,
    );
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
