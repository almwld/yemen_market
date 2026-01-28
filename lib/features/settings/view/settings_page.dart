import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/settings_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<SettingsCubit, bool>(
        builder: (_, dark) => SwitchListTile(
          title: const Text('الوضع الداكن'),
          value: dark,
          onChanged: (_) => context.read<SettingsCubit>().toggle(),
        ),
      ),
    );
  }
}
