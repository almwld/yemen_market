import '../../features/cart/services/cart_service.dart';

class GuestCartMigrator {
  static Future<void> migrate() async {
    final guestItems = await CartService.getGuestCart();
    if (guestItems.isEmpty) return;

    // 🔗 اربطها لاحقًا بسلة المستخدم (Firestore / API)
    // for (final item in guestItems) {
    //   await UserCartService.add(item);
    // }

    await CartService.clearGuestCart();
  }
}
