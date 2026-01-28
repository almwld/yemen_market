class DiscountService {
  static bool enabled = false; // تفعيلها لاحقًا بعد شهرة التطبيق

  static double apply(double price) {
    if (!enabled) return price;
    return price * 0.9; // خصم 10%
  }
}
