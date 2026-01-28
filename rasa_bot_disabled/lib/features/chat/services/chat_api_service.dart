import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatApiService {
  static const String _baseUrl = 'http://127.0.0.1:5005';
  static const String _apiKey =
      'fab2cf0cd6af22baa1d31dd9933c56b252b94c8a750e9ee1d3db2ce764039f16';

  static Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/webhooks/rest/webhook'),
      headers: {
        'Content-Type': 'application/json',
        'X-API-KEY': _apiKey,
      },
      body: jsonEncode({
        'sender': 'flutter_user',
        'message': message,
      }),
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      if (data.isNotEmpty && data.first['text'] != null) {
        return data.first['text'];
      }
      return 'لا يوجد رد';
    } else {
      return 'خطأ في الاتصال بالخادم';
    }
  }
}
