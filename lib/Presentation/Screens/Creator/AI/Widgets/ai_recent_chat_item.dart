import 'package:flutter/material.dart';

class AIRecentChatItem extends StatelessWidget {
  final String title;
  final String time;
  final VoidCallback onTap;
  final bool isSelected;

  const AIRecentChatItem({
    super.key,
    required this.title,
    required this.time,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF3EFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.chat_bubble_outline_rounded,
            size: 18,
            color: Color(0xFF1A1A2E),
          ),
        ),
        title: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1A2E),
          ),
        ),
        subtitle: Text(
          time,
          style: const TextStyle(fontSize: 9, color: Color(0xFF8E8E93)),
        ),
        onTap: onTap,
      ),
    );
  }
}
