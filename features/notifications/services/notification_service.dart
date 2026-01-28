class NotificationService {
  void notifyOrder(String userId, String message) {
    // لاحقًا: Firebase Cloud Messaging
    print('📢 Notification to $userId: $message');
  }

  void notifyAdmin(String message) {
    print('📢 Admin Alert: $message');
  }
}
