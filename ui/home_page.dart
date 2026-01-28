import 'package:flutter/material.dart';
import '../localization/lang_controller.dart';
import '../localization/strings.dart';
import 'marketplace/marketplace_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LangController.lang,
      builder: (_, lang, __) {
        return Scaffold(
          backgroundColor: const Color(0xFF121826),
          appBar: AppBar(
            backgroundColor: const Color(0xFF121826),
            elevation: 0,
            title: Text(Strings.text('title', lang)),
            actions: [
              IconButton(
                icon: const Icon(Icons.language),
                onPressed: LangController.toggle,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MarketplacePage(),
                      ),
                    );
                  },
                  child: const Text('Open Marketplace'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
