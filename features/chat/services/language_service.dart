class LanguageService {
  static bool isEnglish(String text) {
    return RegExp(r'[a-zA-Z]').hasMatch(text);
  }

  static String priceText({
    required String product,
    required int price,
    required bool en,
  }) {
    return en
        ? 'The price of $product is $price YER.'
        : 'سعر $product هو $price ريال يمني.';
  }

  static String notFound(bool en) {
    return en
        ? 'Product not available.'
        : 'المنتج غير متوفر حالياً.';
  }

  static String help(bool en) {
    return en
        ? 'You can ask about prices, delivery, or commission.'
        : 'يمكنك السؤال عن الأسعار أو التوصيل أو العمولة.';
  }
}
