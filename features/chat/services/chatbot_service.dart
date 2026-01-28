import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatbotService {
  static const String _baseUrl = 'http://127.0.0.1:5005/webhooks/rest/webhook';

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'sender': 'user',
          'message': message,
        }),
      );

      final data = jsonDecode(response.body);
      if (data is List && data.isNotEmpty) {
        return data.first['text'] ?? '🤖 لا يوجد رد';
      }
      return '🤖 لم أفهم سؤالك';
    } catch (e) {
      return '⚠️ تعذر الاتصال بالبوت';
    }
  }
}
