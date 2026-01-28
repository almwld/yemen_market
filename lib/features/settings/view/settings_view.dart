import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/settings_cubit.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, bool>(
      builder: (context, dark) {
        return Center(
          child: SwitchListTile(
            title: const Text("الوضع الداكن"),
            value: dark,
            onChanged: (_) {
              context.read<SettingsCubit>().toggle();
            },
          ),
        );
      },
    );
  }
}
