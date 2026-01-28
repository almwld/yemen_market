import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('ar'));

  void switchToArabic() => emit(const Locale('ar'));
  void switchToEnglish() => emit(const Locale('en'));
}
