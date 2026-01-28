import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/app_user.dart';

class UserFirestoreService {
  final _db = FirebaseFirestore.instance;

  Future<AppUser> getUser(String uid) async {
    final doc = await _db.collection('users').doc(uid).get();

    if (!doc.exists) {
      throw Exception('المستخدم غير موجود');
    }

    return AppUser.fromMap(doc.id, doc.data()!);
  }

  Future<void> createUser({
    required String uid,
    required String email,
    String role = 'user',
  }) async {
    await _db.collection('users').doc(uid).set({
      'email': email,
      'role': role,
      'createdAt': FieldValue.serverTimestamp(),
      'active': true,
    });
  }
}
