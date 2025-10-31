import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/routes/navigation.dart';
import 'package:medigo/core/routes/routes.dart';
import 'package:medigo/features/Patient/presentation/pages/notification/widget/cart_notification.dart';
import 'package:medigo/features/Patient/presentation/pages/notification/widget/notification_item.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<NotificationItem> notifications = [
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "Green Valley Hospital",
      address: "123 Health St, Wellness City, 90210",
      timeAgo: "10 mins ago",
      imagePath: AppImages.hospitalPhoto1,
      isUnread: true,
    ),
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "Sunrise Medical Center",
      address: "456 Care Ave, Hopeville, 12345",
      timeAgo: "1 hour ago",
      imagePath: AppImages.hospitalPhoto2,
      isUnread: true,
    ),
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "City Central Hospital",
      address: "789 Cure Blvd, Metroburg, 67890",
      timeAgo: "Yesterday",
      imagePath: AppImages.hospitalPhoto3,
      isUnread: false,
    ),
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "Ocean View Clinic",
      address: "101 Coastline Dr, Seaport, 54321",
      timeAgo: "2 days ago",
      imagePath: AppImages.hospitalPhoto4,
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Notifications', leading: true, action: false),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return NotificationCard(
            notification: notification,
            onTap: () {
              // Handle notification tap
              setState(() {
                pushTo(
                  context: context,
                  route: Routes.HospitalDetails,
                  extra: false,
                );
                notification.isUnread = false;

              });
            },
          );
        },
      ),
    );
  }
}

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
