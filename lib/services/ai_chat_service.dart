import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class AiChatService {
  static const String _endpoint =
      'https://YOUR_CLOUD_FUNCTION_URL/chat';

  static Future<String> sendMessage(String message) async {
    final user = FirebaseAuth.instance.currentUser;

    final response = await http.post(
      Uri.parse(_endpoint),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'uid': user?.uid,
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['reply'];
    } else {
      return '❌ حدث خطأ في الذكاء الاصطناعي';
    }
  }
}
