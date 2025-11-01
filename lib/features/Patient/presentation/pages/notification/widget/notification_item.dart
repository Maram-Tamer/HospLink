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
