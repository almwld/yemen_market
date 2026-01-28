class PriceService {
  static final Map<String, int> _prices = {
    'سكر': 1200,
    'أرز': 2500,
    'دقيق': 1800,
    'زيت': 3200,
  };

  static String getPrice(String product) {
    final price = _prices[product];
    if (price == null) {
      return 'المنتج غير متوفر حالياً.';
    }
    return 'سعر $product هو $price ريال يمني.';
  }
}
