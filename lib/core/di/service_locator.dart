import 'package:get_it/get_it.dart';

import '../../features/home/cubit/home_cubit.dart';
import '../../features/settings/cubit/settings_cubit.dart';

final sl = GetIt.instance;

void setupLocator() {
  sl.registerLazySingleton<HomeCubit>(() => HomeCubit());
  sl.registerLazySingleton<SettingsCubit>(() => SettingsCubit());
}
