class CartService {
  static final List<String> _guestCart = [];
  static final List<String> _userCart = [];

  static Future<List<String>> getGuestCart() async => _guestCart;

  static Future<void> addToGuestCart(String item) async {
    _guestCart.add(item);
  }

  static Future<void> addToUserCart(String item) async {
    _userCart.add(item);
  }

  static Future<void> clearGuestCart() async {
    _guestCart.clear();
  }

  static List<String> get userCart => _userCart;
}
