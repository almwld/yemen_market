class Strings {
  static String text(String key, String lang) {
    const data = {
      'title': {
        'ar': 'سوق اليمن',
        'en': 'Yemen Market',
      },
      'categories': {
        'ar': 'الأقسام',
        'en': 'Categories',
      },
    };

    return data[key]?[lang] ?? '';
  }
}
