import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Patient/notification/page/notification_screen.dart';
import 'package:medigo/features/Patient/notification/widget/notification_item.dart';

class DetailsCartNotification extends StatelessWidget {
  const DetailsCartNotification({
    super.key,
    required this.notification,
  });

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            notification.title,
            style: AppFontStyles.getSize16(
              fontSize: 16,
              fontColor: notification.isUnread
                  ? AppColors.red
                  : AppColors.primaryGreenColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            notification.hospitalName,
            style: AppFontStyles.getSize14(
              fontSize: 14,
              fontColor: AppColors.darkColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            notification.address,
            style: AppFontStyles.getSize14(
              fontSize: 12,
              fontColor: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            notification.timeAgo,
            style: AppFontStyles.getSize14(
              fontSize: 12,
              fontColor: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
