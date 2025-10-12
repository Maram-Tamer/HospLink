import 'package:flutter/material.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

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
      imagePath: "assets/images/hospital.png",
      isUnread: true,
    ),
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "Sunrise Medical Center",
      address: "456 Care Ave, Hopeville, 12345",
      timeAgo: "1 hour ago",
      imagePath: "assets/images/hospital.png",
      isUnread: true,
    ),
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "City Central Hospital",
      address: "789 Cure Blvd, Metroburg, 67890",
      timeAgo: "Yesterday",
      imagePath: "assets/images/hospital.png",
      isUnread: false,
    ),
    NotificationItem(
      title: "Application Accepted!",
      hospitalName: "Ocean View Clinic",
      address: "101 Coastline Dr, Seaport, 54321",
      timeAgo: "2 days ago",
      imagePath: "assets/images/hospital.png",
      isUnread: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fillTextForm,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.darkColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Notifications",
          style: AppFontStyles.getSize18(
            fontSize: 18,
            fontColor: AppColors.darkColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [],
      ),
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
                notification.isUnread = false;
              });
            },
          );
        },
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String hospitalName;
  final String address;
  final String timeAgo;
  final String imagePath;
  bool isUnread;

  NotificationItem({
    required this.title,
    required this.hospitalName,
    required this.address,
    required this.timeAgo,
    required this.imagePath,
    required this.isUnread,
  });
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
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: AppFontStyles.getSize16(
                      fontSize: 16,
                      fontColor: AppColors.primaryGreenColor,
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
            ),
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
      ),
    );
  }
}
