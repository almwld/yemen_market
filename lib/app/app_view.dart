import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cubit.dart';
import '../features/home/view/home_view.dart';
import '../features/settings/view/settings_view.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, int>(
      builder: (context, index) {
        return Scaffold(
          body: IndexedStack(
            index: index,
            children: const [
              HomeView(),
              SettingsView(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (i) => context.read<AppCubit>().changeTab(i),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "الرئيسية",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "الإعدادات",
              ),
            ],
          ),
        );
      },
    );
  }
}
