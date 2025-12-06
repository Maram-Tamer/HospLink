import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
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
  List<NotificationItem> allNotifications = [
    NotificationItem(
      name: "Sarah Johnson",
      messagePreview: "Needs medical review — symptoms worsening.",
      timeAgo: "2m ago",
      avatarPath: AppImages.PatientPhoto4,
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: MainAppBar(
        title: 'Notifications',
        leading: false,
        action: false,
        color: theme.colorScheme.primary, // theme responsive
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: allNotifications.length,
              itemBuilder: (context, index) {
                final notification = allNotifications[index];

                return Dismissible(
                  key: UniqueKey(),

                  // 👉 Swipe RIGHT = Mark as Read
                  // 👉 Swipe LEFT = Delete
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child:
                        const Icon(Icons.done, color: Colors.white, size: 28),
                  ),

                  secondaryBackground: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.red,
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child:
                        const Icon(Icons.delete, color: Colors.white, size: 28),
                  ),

                  confirmDismiss: (direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      // swipe right — mark as read
                      setState(() => notification.isUnread = false);
                      return false; // don’t remove from the list
                    } else {
                      // swipe left — delete
                      return true;
                    }
                  },

                  onDismissed: (_) {
                    setState(() => allNotifications.removeAt(index));
                  },

                  child: NotificationCard(
                    notification: notification,
                    onTap: () {
                      setState(() => notification.isUnread = false);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
