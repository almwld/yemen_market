class ProductService {
  static final List<Map<String, dynamic>> products = [
    {'name_ar': 'سكر', 'name_en': 'sugar', 'price': 1200},
    {'name_ar': 'أرز', 'name_en': 'rice', 'price': 2500},
    {'name_ar': 'دقيق', 'name_en': 'flour', 'price': 1800},
    {'name_ar': 'زيت', 'name_en': 'oil', 'price': 3200},
  ];

  static Map<String, dynamic>? find(String text, bool en) {
    for (final p in products) {
      if (en && text.contains(p['name_en'])) return p;
      if (!en && text.contains(p['name_ar'])) return p;
    }
    return null;
  }
}
