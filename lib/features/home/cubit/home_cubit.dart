import 'package:hydrated_bloc/hydrated_bloc.dart';

class HomeCubit extends HydratedCubit<int> {
  HomeCubit() : super(0);

  void increment() => emit(state + 1);

  @override
  int? fromJson(Map<String, dynamic> json) => json['value'];

  @override
  Map<String, dynamic>? toJson(int state) => {'value': state};
}
