import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/features/Patient/presentation/pages/notification/widget/details_cart_notification.dart';
import 'package:medigo/features/Patient/presentation/pages/notification/widget/notification_item.dart';

class CartNotification extends StatelessWidget {
  const CartNotification({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Hospital image
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: AppColors.primaryGreenColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                notification.imagePath,
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
              decoration: const BoxDecoration(
                color: AppColors.primaryGreenColor,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
