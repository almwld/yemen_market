import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppCubit extends HydratedCubit<int> {
  AppCubit() : super(0);

  void changeTab(int index) => emit(index);

  @override
  int? fromJson(Map<String, dynamic> json) {
    return json['tab'] as int?;
  }

  @override
  Map<String, dynamic>? toJson(int state) {
    return {'tab': state};
  }
}
