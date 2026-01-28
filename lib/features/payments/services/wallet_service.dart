import 'package:shared_preferences/shared_preferences.dart';

class WalletService {
  static const _walletNameKey = 'wallet_name';
  static const _walletNumberKey = 'wallet_number';

  static Future<void> saveWallet({
    required String name,
    required String number,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_walletNameKey, name);
    await prefs.setString(_walletNumberKey, number);
  }

  static Future<Map<String, String>> loadWallet() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'name': prefs.getString(_walletNameKey) ?? '',
      'number': prefs.getString(_walletNumberKey) ?? '',
    };
  }
}
