import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends HydratedCubit<bool> {
  SettingsCubit() : super(false);

  void toggle() => emit(!state);

  @override
  bool? fromJson(Map<String, dynamic> json) => json['dark'];

  @override
  Map<String, dynamic>? toJson(bool state) => {'dark': state};
}
