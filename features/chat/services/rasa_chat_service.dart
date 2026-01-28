import 'dart:convert';
import 'package:http/http.dart' as http;

class RasaChatService {
  final String baseUrl = 'http://YOUR_SERVER_IP:5005/webhooks/rest/webhook';

  Future<String> sendMessage(String message) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'sender': 'flutter_user',
        'message': message,
      }),
    );

    final data = jsonDecode(response.body);
    if (data.isNotEmpty) {
      return data[0]['text'];
    }
    return 'لم أفهم سؤالك 🤔';
  }
}
