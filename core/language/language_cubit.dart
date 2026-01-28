import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<Locale?> {
  LanguageCubit() : super(null); // null = لغة النظام

  void setArabic() => emit(const Locale('ar'));
  void setEnglish() => emit(const Locale('en'));
  void followSystem() => emit(null);
}
