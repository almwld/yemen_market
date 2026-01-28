class AdminNotification {
  final String title;
  final String message;
  final DateTime time;

  AdminNotification({
    required this.title,
    required this.message,
    DateTime? time,
  }) : time = time ?? DateTime.now();
}

class NotificationService {
  static final List<AdminNotification> _notifications = [];

  static void notify({
    required String title,
    required String message,
  }) {
    _notifications.insert(
      0,
      AdminNotification(title: title, message: message),
    );
  }

  static List<AdminNotification> get all => _notifications;
}
