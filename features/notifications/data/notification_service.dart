import 'notification_model.dart';

class NotificationService {
  final List<AppNotification> _notifications = [];

  List<AppNotification> getAll() => _notifications;

  void addNotification(AppNotification notification) {
    _notifications.insert(0, notification);
  }

  void markAsRead(String id) {
    final index = _notifications.indexWhere((n) => n.id == id);
    if (index != -1) {
      _notifications[index] =
          _notifications[index].copyWith(isRead: true);
    }
  }
}
