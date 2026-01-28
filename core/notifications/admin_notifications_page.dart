import 'package:flutter/material.dart';
import 'notification_service.dart';

class AdminNotificationsPage extends StatelessWidget {
  const AdminNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final notifications = NotificationService.all;

    return Scaffold(
      appBar: AppBar(title: const Text('إشعارات الإدارة')),
      body: notifications.isEmpty
          ? const Center(child: Text('لا توجد إشعارات'))
          : ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, i) {
                final n = notifications[i];
                return ListTile(
                  leading: const Icon(Icons.notifications),
                  title: Text(n.title),
                  subtitle: Text(n.message),
                  trailing: Text(
                    '${n.time.hour}:${n.time.minute.toString().padLeft(2, '0')}',
                  ),
                );
              },
            ),
    );
  }
}
