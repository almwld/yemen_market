import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static final _auth = FirebaseAuth.instance;
  static final _db = FirebaseFirestore.instance;

  static Future<User?> signInGuest() async {
    final cred = await _auth.signInAnonymously();
    final user = cred.user;

    if (user != null) {
      await _db.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'createdAt': FieldValue.serverTimestamp(),
        'wallet': 0,
        'vip': false,
      }, SetOptions(merge: true));
    }
    return user;
  }
}
