import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/page/notification_screen.dart';

class DetailsCartNotification extends StatelessWidget {
  const DetailsCartNotification({super.key, required this.notification});

  final NotificationItem notification;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  notification.name,
                  style: AppFontStyles.getSize14(
                    fontSize: 14,
                    fontColor: AppColors.darkColor,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                notification.timeAgo,
                style: AppFontStyles.getSize12(
                  fontColor: AppColors.greyColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            notification.messagePreview,
            style: AppFontStyles.getSize14(
              fontSize: 12,
              fontColor: AppColors.greyColor,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
        ],
      ),
    );
  }
}
