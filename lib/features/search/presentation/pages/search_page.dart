import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('بحث شامل')),
      body: ListView(
        children: const [
          ListTile(title: Text('منتجات')),
          ListTile(title: Text('متاجر')),
          ListTile(title: Text('عروض')),
          ListTile(title: Text('بائعين')),
        ],
      ),
    );
  }
}
