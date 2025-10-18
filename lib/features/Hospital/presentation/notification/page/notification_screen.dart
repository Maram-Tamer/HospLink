import 'package:flutter/material.dart';
import 'package:medigo/components/App_Bar/app__bar.dart';
import 'package:medigo/core/constatnts/images.dart';
import 'package:medigo/core/utils/colors.dart';
import 'package:medigo/core/utils/fonts.dart';

class NotificationItem {
  final String name;
  final String messagePreview;
  final String timeAgo;
  final String avatarPath;
  final bool isHigh;
  bool isUnread;

  NotificationItem({
    required this.name,
    required this.messagePreview,
    required this.timeAgo,
    required this.avatarPath,
    required this.isHigh,
    required this.isUnread,
  });
}

// Details widget
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
          if (notification.isHigh)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.red.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                'High',
                style: AppFontStyles.getSize12(
                  fontColor: AppColors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

// Card widget for a notification

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
            color: Colors.black.withValues(alpha: 0.05),
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
              color: AppColors.primaryGreenColor.withValues(alpha: 0.1),
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
      avatarPath: AppImages.profilePNG,
      isHigh: true,
      isUnread: true,
    ),
    NotificationItem(
      name: "David Chen",
      messagePreview: "Follow-up complete.",
      timeAgo: "1h ago",
      avatarPath: AppImages.profilePNG,
      isHigh: false,
      isUnread: true,
    ),
    NotificationItem(
      name: "Maria Garcia",
      messagePreview: "Check blood pressure results.",
      timeAgo: "3h ago",
      avatarPath: AppImages.profilePNG,
      isHigh: false,
      isUnread: true,
    ),
    NotificationItem(
      name: "John Smith",
      messagePreview: "New prescription added.",
      timeAgo: "1d ago",
      avatarPath: AppImages.profilePNG,
      isHigh: false,
      isUnread: false,
    ),
  ];

  List<NotificationItem> get filteredNotifications {
    if (showHighOnly) {
      return allNotifications
          .where((notification) => notification.isHigh)
          .toList();
    }
    return allNotifications;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(title: 'Notifications', leading: true, action: false),
      body: Column(
        children: [
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showHighOnly = false;
                    });
                  },
                  child: _FilterChip(label: 'All', selected: !showHighOnly),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      showHighOnly = true;
                    });
                  },
                  child: _FilterChip(label: 'High', selected: showHighOnly),
                ),
              ],
            ),
          ),
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
      bottomNavigationBar: _BottomNavigationBar(),
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

class _FilterChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _FilterChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? AppColors.primaryGreenColor : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        label,
        style: AppFontStyles.getSize14(
          fontColor: selected ? Colors.white : AppColors.darkColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        selectedItemColor: AppColors.primaryGreenColor,
        unselectedItemColor: AppColors.greyColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        currentIndex: 0, // Patients tab is selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.people, size: 24),
            label: 'Patients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, size: 24),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add, size: 24),
            label: 'Add Patient',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 24),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
