import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/language/language_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              'اللغة',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () =>
                  context.read<LanguageCubit>().switchToArabic(),
              child: const Text('العربية'),
            ),
            ElevatedButton(
              onPressed: () =>
                  context.read<LanguageCubit>().switchToEnglish(),
              child: const Text('English'),
            ),
          ],
        ),
      ),
    );
  }
}
