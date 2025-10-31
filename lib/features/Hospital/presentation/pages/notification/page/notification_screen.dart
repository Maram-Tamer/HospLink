import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/widget/cart_notification.dart';
import 'package:medigo/features/Hospital/presentation/pages/notification/widget/notification_card.dart';

class NotificationItem {
  final String name;
  final String messagePreview;
  final String timeAgo;
  final String avatarPath;
  bool isUnread;

  NotificationItem({
    required this.name,
    required this.messagePreview,
    required this.timeAgo,
    required this.avatarPath,
    required this.isUnread,
  });
}

class HospitalNotificationScreen extends StatefulWidget {
  const HospitalNotificationScreen({super.key});

  @override
  State<HospitalNotificationScreen> createState() =>
      _HospitalNotificationScreenState();
}

class _HospitalNotificationScreenState
    extends State<HospitalNotificationScreen> {
  bool showHighOnly = false;

  final List<NotificationItem> allNotifications = [
    NotificationItem(
      name: "Sarah Johnson",
      messagePreview: "Needs medical review — symptoms worsening.",
      timeAgo: "2m ago",
      avatarPath: AppImages.PatientPhoto1,
      isUnread: true,
    ),
    NotificationItem(
      name: "David Chen",
      messagePreview: "Follow-up complete.",
      timeAgo: "1h ago",
      avatarPath: AppImages.profilePNG,
      isUnread: true,
    ),
    NotificationItem(
      name: "Maria Garcia",
      messagePreview: "Check blood pressure results.",
      timeAgo: "3h ago",
      avatarPath: AppImages.PatientPhoto3,
      isUnread: true,
    ),
    NotificationItem(
      name: "John Smith",
      messagePreview: "New prescription added.",
      timeAgo: "1d ago",
      avatarPath: AppImages.PatientPhoto4,
      isUnread: false,
    ),
  ];

  List<NotificationItem> get filteredNotifications {
    return allNotifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Notifications', leading: false, action: false),
      body: Column(
        children: [
          const SizedBox(height: 12),
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredNotifications.length,
              itemBuilder: (context, index) {
                final notification = filteredNotifications[index];
                return NotificationCard(
                  notification: notification,
                  onTap: () {
                    setState(() {
                      notification.isUnread = false;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
