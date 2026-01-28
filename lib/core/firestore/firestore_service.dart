class FirestoreService {
  // Mock Firestore (جاهز للاستبدال بـ Firebase لاحقًا)

  static final Map<String, List<Map<String, dynamic>>> _db = {
    'users': [],
    'orders': [],
    'products': [],
  };

  static Future<void> add(String collection, Map<String, dynamic> data) async {
    _db[collection]?.add(data);
  }

  static Future<List<Map<String, dynamic>>> getAll(String collection) async {
    return _db[collection] ?? [];
  }
}
