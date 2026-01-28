// 🔥 Yemen Market Firebase Configuration - الإصدار النهائي
// ✅ جميع المعلومات صحيحة ومأخوذة من Firebase Console

class FirebaseConfig {
  // Firebase Web App Configuration
  static const Map<String, String> config = {
    "apiKey": "AIzaSyDK_sSIUTKRU2lJS7HlUOrQ-3rde-KbWoA",
    "authDomain": "yemenmarket-6efa1.firebaseapp.com",
    "projectId": "yemenmarket-6efa1",
    "storageBucket": "yemenmarket-6efa1.firebasestorage.app",
    "messagingSenderId": "386995199915",
    "appId": "1:386995199915:web:cdde7666a6d793a3753cee",
    "measurementId": "G-RSF9H6LKCE",
  };

  // Collections names
  static const String usersCollection = 'users';
  static const String productsCollection = 'products';
  static const String ordersCollection = 'orders';
  static const String categoriesCollection = 'categories';
  static const String chatsCollection = 'chats';
  static const String walletsCollection = 'wallets';
  
  // Storage paths
  static const String productsStoragePath = 'products';
  static const String usersStoragePath = 'users/profile_pictures';
  static const String chatImagesStoragePath = 'chats/images';
  
  // App Settings
  static const String appName = 'Yemen Market';
  static const String supportEmail = 'almwldahmed199@gmail.com';
  static const double commissionRate = 0.05; // 5%
  
  // Project Info
  static const String projectId = 'yemenmarket-6efa1';
  static const String projectNumber = '386995199915';
}
