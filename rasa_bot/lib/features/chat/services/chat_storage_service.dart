import 'package:cloud_firestore/cloud_firestore.dart';

class ChatStorageService {
  static final _firestore = FirebaseFirestore.instance;

  static Future<void> saveMessage({
    required String sender,
    required String message,
  }) async {
    await _firestore.collection('chats').add({
      'sender': sender,
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  static Stream<QuerySnapshot> getMessages() {
    return _firestore
        .collection('chats')
        .orderBy('timestamp')
        .snapshots();
  }
}
