import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentLogService {
  static const _key = 'payment_logs';

  static Future<void> addPayment(double amount) async {
    final prefs = await SharedPreferences.getInstance();
    final logs = prefs.getStringList(_key) ?? [];

    logs.add(jsonEncode({
      'amount': amount,
      'date': DateTime.now().toIso8601String(),
    }));

    await prefs.setStringList(_key, logs);
  }

  static Future<List<Map<String, dynamic>>> getPayments() async {
    final prefs = await SharedPreferences.getInstance();
    final logs = prefs.getStringList(_key) ?? [];

    return logs
        .map((e) => jsonDecode(e) as Map<String, dynamic>)
        .toList();
  }
}
