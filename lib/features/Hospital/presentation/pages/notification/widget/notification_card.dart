import 'package:flutter/material.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/page/notification_screen.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/widget/cart_notification.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem notification;
  final VoidCallback onTap;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CartNotification(notification: notification),
    );
  }
}
