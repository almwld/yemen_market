import '../models/discount.dart';

class DiscountService {
  static final List<Discount> _discounts = [
    Discount(
      title: '🔥 خصم الافتتاح',
      code: 'WELCOME10',
      percent: 10,
      expiry: DateTime(2099),
    ),
    Discount(
      title: '💎 VIP Special',
      code: 'VIP25',
      percent: 25,
      vipOnly: true,
      expiry: DateTime(2099),
    ),
  ];

  static List<Discount> getAvailable(bool isVip) {
    return _discounts.where((d) =>
        d.isValid && (!d.vipOnly || isVip)).toList();
  }
}
