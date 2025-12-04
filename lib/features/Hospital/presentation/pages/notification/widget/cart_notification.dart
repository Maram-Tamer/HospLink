import 'package:flutter/material.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/page/notification_screen.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/widget/details_cart_notification.dart';

class CartNotification extends StatelessWidget {
  const CartNotification({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface, // adapt to light/dark theme
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.05), // theme-aware shadow
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1), // subtle background
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                notification.avatarPath,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Content
          DetailsCartNotification(notification: notification),
          // Unread indicator
          if (notification.isUnread)
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: theme.colorScheme.primary, // theme-aware indicator
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
