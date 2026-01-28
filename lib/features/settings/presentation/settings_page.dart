import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/language/language_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = context.read<LanguageCubit>();

    return Scaffold(
      appBar: AppBar(title: const Text('الإعدادات')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('العربية'),
            onTap: lang.setArabic,
          ),
          ListTile(
            title: const Text('English'),
            onTap: lang.setEnglish,
          ),
          ListTile(
            title: const Text('حسب لغة النظام'),
            onTap: lang.followSystem,
          ),
        ],
      ),
    );
  }
}
