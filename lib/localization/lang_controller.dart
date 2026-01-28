import 'package:flutter/material.dart';

class LangController {
  static ValueNotifier<String> lang = ValueNotifier('ar');

  static void toggle() {
    lang.value = lang.value == 'ar' ? 'en' : 'ar';
  }
}
