import 'package:flutter/material.dart';
import '../services/chat_api_service.dart';
import '../services/chat_storage_service.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];

  Future<void> _send() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      _messages.add('🧑‍💬 $text');
      _controller.clear();
    });

    await ChatStorageService.saveMessage(
      sender: 'user',
      message: text,
    );

    final reply = await ChatApiService.sendMessage(text);

    setState(() {
      _messages.add('🤖 $reply');
    });

    await ChatStorageService.saveMessage(
      sender: 'bot',
      message: reply,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الدردشة الذكية')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Text(_messages[i]),
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  decoration:
                      const InputDecoration(hintText: 'اكتب سؤالك...'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: _send,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
