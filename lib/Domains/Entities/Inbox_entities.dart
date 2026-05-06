class InboxEntity {
  final String title;
  final String subtitle;
  final String time;
  final int unread;
  final String category;

  InboxEntity({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.unread,
    required this.category,
  });
}
