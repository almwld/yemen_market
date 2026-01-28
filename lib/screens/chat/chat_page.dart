import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  bool _loading = false;

  Future<void> sendMessage(String msg) async {
    setState(() {
      _messages.add({'user': msg});
      _loading = true;
    });
    _controller.clear();

    // رابط Firebase Function
    final url = Uri.parse('https://us-central1-YOUR_PROJECT.cloudfunctions.net/chatAI');

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'message': msg}));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _messages.add({'bot': data['reply']});
        _loading = false;
      });
    } else {
      setState(() {
        _messages.add({'bot': '❌ خطأ في الاتصال'});
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🤖 مساعد السوق')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (_, index) {
                final msg = _messages[index];
                if (msg.containsKey('user')) {
                  return Align(
                    alignment: Alignment.centerRight,
                    child: Card(
                      color: Colors.green.shade100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(msg['user']!),
                      ),
                    ),
                  );
                } else {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Card(
                      color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(msg['bot']!),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          if (_loading) const LinearProgressIndicator(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(hintText: 'اكتب رسالتك هنا'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_controller.text.isNotEmpty) sendMessage(_controller.text);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
